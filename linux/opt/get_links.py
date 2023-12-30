"""
Get direct links from a given markdown
note path.

This code should be put in your PATH variable
and an alias should point to it.
"""

import re
from os import environ, listdir
import fire
from termcolor import colored


def find_links(note_prefix=''):
    """
    Find direct internal links from
    a given markdown note datetimestamp prefix.
    Notes live in hard-coded Dropbox path.
    """

    if not note_prefix:
        print(colored('No file prefix specified', 'red'))
    if type(note_prefix) != str:
        note_prefix = str(note_prefix)
    home_path = environ['HOME']
    base_folder = f'{home_path}/Dropbox/personal/external-brain'
    # Resolve prefix to file name
    note = [filename for filename in listdir(base_folder) if filename.startswith(note_prefix)][0]
    file = open(f'{base_folder}/{note}')
    text = file.read()
    file.close()
    internal_link_regex = r'\[\[(.*?)\]\]+'
    # Get links and remove duplicates
    links = list(set(re.findall(internal_link_regex, text)))
    if not links:
        print(colored('No links found.', 'yellow'))
    for link in links:
        print(link)


if __name__ == '__main__':
    fire.Fire(find_links)
