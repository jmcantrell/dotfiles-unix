# main commands file at: /usr/share/doc/ranger/config/commands.py

import os
from glob import glob
from datetime import datetime, timedelta
from configparser import ConfigParser

import ranger
from ranger.api.commands import Command
from ranger.ext.shell_escape import shell_escape as esc

pager = os.environ.get("PAGER", ranger.DEFAULT_PAGER)

trash_dir = os.path.expanduser("~/.local/share/Trash")


def escape(value):
    if isinstance(value, dict):
        return {k: esc(v) for k, v in value.items()}
    if isinstance(value, (tuple, list)):
        return [esc(v) for v in value]
    return esc(value)


def get_trashinfos(older_than=None):
    infos = glob(os.path.join(trash_dir, "info", "*.trashinfo"))

    if not older_than:
        return infos

    filtered_infos = []

    for info in infos:
        config = ConfigParser()
        config.read(info)

        deletion_date = datetime.fromisoformat(config["Trash Info"]["DeletionDate"])

        if deletion_date < older_than:
            filtered_infos.append(info)

    return filtered_infos


class UserCommand(Command):
    command = None
    flags = None

    def run(self, command=None, **kwargs):
        command = command or self.command

        if not command:
            self.fm.notify("Command not set!", bad=True)
            return

        if "%" in command:
            command = self.fm.substitute_macros(command, escape=True)

        if self.flags:
            kwargs["flags"] = self.flags

        self.fm.execute_command(command, **kwargs)

    def execute(self):
        self.run()


class bulkrename(UserCommand):
    """:bulkrename

    This command opens a list of selected files in an external editor.
    After you edit and save the file, it rename the files accordingly.
    """

    command = "br %s"


class apack(UserCommand):
    """:pack <archive>

    Pack the selected files using apack.
    """

    def execute(self):
        archive = self.rest(1)

        if not archive:
            self.fm.notify("Missing archive filename!", bad=True)
            return

        self.run("apack {} %s".format(archive), flags="p")

    def tab(self, tabnum):
        return self._tab_directory_content()


class aunpack(UserCommand):
    """:unpack

    Unpack the selected files using aunpack.
    """

    command = "aunpack %s"
    flags = "p"


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
