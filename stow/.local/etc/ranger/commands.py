import os
import shutil

from ranger.api.commands import Command


class mkmv(Command):
    """:mkmv <directory>

    Creates directory and moves the selected files into it.

    "Selection" is defined as all the "marked files" (by default, you
    can mark files with space or v). If there are no marked files,
    use the "current file" (where the cursor is)
    """

    allow_abbrev = False

    def execute(self):
        dirname = self.rest(1)

        if not dirname:
            self.fm.notify("Syntax: mkmv <directory>", bad=True)
            return

        cwd = self.fm.thisdir
        file = self.fm.thisfile
        if not cwd or not file:
            self.fm.notify("Error: no file selected!", bad=True)
            return

        directory = os.path.join(cwd.path, dirname)
        files = self.fm.thistab.get_selection()

        try:
            os.makedirs(directory)
        except FileExistsError:
            self.fm.notify("File or directory exists!", bad=True)
        except PermissionError:
            self.fm.notify("Insufficient permissions!", bad=True)

        for file in files:
            filename = os.path.split(file.path)[1]
            shutil.move(file.path, os.path.join(directory, filename))
