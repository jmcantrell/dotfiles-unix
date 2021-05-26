from ranger.api.commands import Command


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
