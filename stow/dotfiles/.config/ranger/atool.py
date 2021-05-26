from command import UserCommand


class pack(UserCommand):
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


class unpack(UserCommand):
    """:unpack

    Unpack the selected files using aunpack.
    """

    command = "aunpack %s"
    flags = "p"
