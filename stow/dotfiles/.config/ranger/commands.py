# main commands file at: /usr/share/doc/ranger/config/commands.py

import os
from glob import glob

import ranger
from ranger.api.commands import Command
from ranger.ext.shell_escape import shell_escape as esc

pager = os.environ.get('PAGER', ranger.DEFAULT_PAGER)


def escape(value):
	if isinstance(value, dict):
		return {k: esc(v) for k, v in value.items()}
	if isinstance(value, (tuple, list)):
		return [esc(v) for v in value]
	return esc(value)


def get_trashinfo():
	t = os.path.expanduser('~/.local/share/Trash')
	return glob(os.path.join(t, 'info', '*.trashinfo'))


class UserCommand(Command):

	command = ''

	def run(self, command=None, **kwargs):
		command = command or self.command
		if '%' in command:
			command = self.fm.substitute_macros(command, escape=True)
		self.fm.execute_command(command, **kwargs)

	def untag(self):
		for f in self.fm.tags.tags:
			if str(f).startswith(self.fm.thisfile.path):
				self.fm.tags.remove(f)


class bulkrename(UserCommand):
	""":bulkrename

	This command opens a list of selected files in an external editor.
	After you edit and save the file, it rename the files accordingly.
	"""

	command = 'rn %s'


class apack(UserCommand):
	""":pack <archive>

	Pack the selected files using apack.
	"""

	command = 'apack {} %s'

	def execute(self):
		archive = self.rest(1)
		if not archive:
			self.fm.notify("Missing archive filename!", bad=True)
			return
		command = self.command.format(archive)
		self.run([command, archive])

	def tab(self, tabnum):
		return self._tab_directory_content()


class aunpack(UserCommand):
	""":unpack

	Unpack the selected files using aunpack.
	"""

	command = 'aunpack %s'


class trash(UserCommand):
	""":trash

	Trash the selected files.
	"""

	command = 'trash %s'

	def execute(self):
		confirm = self.fm.settings.confirm_on_delete
		cwd = self.fm.thisdir
		cf = self.fm.thisfile

		if not cwd or not cf:
			self.fm.notify("No file selected for deletion!", bad=True)
			return

		many_files = (
			self.fm.thisdir.marked_items or (
				cf.is_directory and not cf.is_link and len(os.listdir(cf.path)) > 0
			)
		)

		if confirm != 'never' and (confirm != 'multiple' or many_files):
			selection = self.fm.thistab.get_selection()
			num_files = len(selection)
			self.fm.ui.console.ask(
				"Confirm trash of {} {}? (y/N)".format(
					num_files, 'files' if num_files > 1 else 'file'
				),
				self._ask_callback, ('n', 'N', 'y', 'Y')
			)
		else:
			# no need for a confirmation
			self.run()

	def _ask_callback(self, answer):
		if answer.lower() == 'y':
			self.run()


class trashrestore(UserCommand):
	""":trashrestore

	Restore file from the trash.
	"""

	command = 'trash-restore'


class trashlist(UserCommand):
	""":trashlist

	List the trash contents.
	"""

	command = 'trash-list'

	def execute(self):
		trashinfo = get_trashinfo()
		if not trashinfo:
			self.fm.notify("Trash is empty.")
			return
		self.run()


class trashempty(UserCommand):
	""":trashempty

	Empty the trash.
	"""

	command = 'trash-empty'

	def execute(self):
		trashinfo = get_trashinfo()
		if not trashinfo:
			self.fm.notify("Trash is already empty!", bad=True)
			return
		num = len(trashinfo)
		self.fm.ui.console.ask(
			"Empty trash of {} {}? (y/N)".format(
				num, 'items' if num > 1 else 'item'
			),
			self._ask_callback, 'nNyY'
		)

	def _ask_callback(self, answer):
		if answer.lower() == 'y':
			self.run()
