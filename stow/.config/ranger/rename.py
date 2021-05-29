from command import UserCommand


class bulkrename(UserCommand):
    """:bulkrename

    This command opens a list of selected files in an external editor.
    After you edit and save the file, it rename the files accordingly.
    """

    command = "br %s"
