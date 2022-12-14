# Modules available by default in interactive sessions:
import sys, os
from pprint import pprint

# Enable tab completion at input prompts.
import readline

readline.parse_and_bind("tab: complete")

# Display values with pprint by default.
sys.displayhook = pprint
