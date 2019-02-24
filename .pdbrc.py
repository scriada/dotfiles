from pdb import DefaultConfig


class Config(DefaultConfig):
    """
    Configuration for pdb++
    See .fancycompleterc.py for readline setup
    """

    prompt = 'pdb> '
    encoding = 'ascii'
    current_line_color = 7
    sticky_by_default = True
