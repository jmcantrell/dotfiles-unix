import os
from datetime import datetime, timedelta

from trashcli.fs import FileSystemReader
from trashcli.list import DeletionDateExtractor
from trashcli.list_mount_points import os_mount_points
from trashcli.trash import TrashDir, TopTrashDirRules, TrashDirsScanner

from command import UserCommand


def get_trashinfos(older_than=None):
    trashinfos = []

    file_reader = FileSystemReader()
    extractor = DeletionDateExtractor()
    trashdirs_scanner = TrashDirsScanner(
        os.environ, os.getuid, os_mount_points, TopTrashDirRules(file_reader)
    )

    trash_dirs = trashdirs_scanner.scan_trash_dirs()

    for event, args in trash_dirs:
        if event == TrashDirsScanner.Found:
            path, volume = args
            trash_dir = TrashDir(file_reader)
            for trashinfo in trash_dir.list_trashinfo(path):
                try:
                    contents = file_reader.contents_of(trashinfo)
                except IOError:
                    print(f"unable to read trashinfo file: {trashinfo}")
                else:
                    if older_than:
                        deletion_date = extractor.extract_attribute(trashinfo, contents)
                        if deletion_date < older_than:
                            continue

                    trashinfos.append(trashinfo)

    return trashinfos


class trash(UserCommand):
    """:trash

    Trash the selected files.
    """

    command = "trash %s"
    flags = "s"

    def execute(self):
        confirm = self.fm.settings.confirm_on_delete
        cwd = self.fm.thisdir
        cf = self.fm.thisfile

        if not cwd or not cf:
            self.fm.notify("No file selected for deletion!", bad=True)
            return

        many_files = self.fm.thisdir.marked_items or (
            cf.is_directory and not cf.is_link and len(os.listdir(cf.path)) > 0
        )

        def ask_callback(answer):
            if answer.lower() == "y":
                self.run()

        if confirm != "never" and (confirm != "multiple" or many_files):
            selection = self.fm.thistab.get_selection()
            num_files = len(selection)
            self.fm.ui.console.ask(
                "Confirm trash of {} {}? (y/N)".format(
                    num_files, "files" if num_files > 1 else "file"
                ),
                ask_callback,
                ("n", "N", "y", "Y"),
            )
        else:
            # no need for a confirmation
            self.run()


class trashrestore(UserCommand):
    """:trashrestore

    Restore file from the trash.
    """

    command = "trash-restore"


class trashlist(UserCommand):
    """:trashlist

    List the trash contents.
    """

    command = "trash-list"
    flags = "p"

    def execute(self):
        if not get_trashinfos():
            self.fm.notify("Trash is empty.")
            return

        self.run()


class trashempty(UserCommand):
    """:trashempty [days]

    Empty the trash.
    If days is provided, only delete files deleted before that number of days ago.
    """

    command = "trash-empty {}"
    flags = "s"

    def execute(self):

        arg = self.rest(1)

        try:
            days = int(arg) if arg else None
        except ValueError:
            self.fm.notify("Invalid days argument!", bad=True)
            return

        threshold_date = (datetime.now() - timedelta(days=days)) if days else None

        trashinfos = get_trashinfos(older_than=threshold_date)

        if not trashinfos:
            self.fm.notify("Trash is already empty!", bad=True)
            return

        num = len(trashinfos)

        def ask_callback(answer):
            if answer.lower() == "y":
                self.run(self.command.format(days or ""))

        self.fm.ui.console.ask(
            "Empty trash of {} {}? (y/N)".format(num, "items" if num > 1 else "item"),
            ask_callback,
            "nNyY",
        )
