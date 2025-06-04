import os
import atexit
from fancycompleter import DefaultConfig


class Config(DefaultConfig):

    prefer_pyrepl = False  # force fancycompleter to use the standard readline

    def setup(self):
        DefaultConfig.setup(self)

        _setup_readline(self.readline)


def _setup_readline(readline):

    histfile = os.path.expanduser("~/.fancy-hist")

    readline.parse_and_bind("\\C-k: history-search-backward")
    readline.parse_and_bind("\\C-j: history-search-forward")

    try:
        readline.read_history_file(histfile)
    except IOError:
        pass

    readline.set_history_length(500)

    atexit.register(readline.write_history_file, histfile)
