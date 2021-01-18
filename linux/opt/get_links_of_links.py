"""
Get links of links from a given markdown
note path.

This code should be put in your PATH variable
and an alias should point to it.
"""

import re
import os
import fire
from termcolor import colored


def find_links(note_name):
    """
    Find direct internal links from
    a given markdown note name. Notes
    live in hard-coded Dropbox path.
    """

    if not note_name:
        print(colored('No file path specified', 'red'))
    home_path = os.environ['HOME']
    file = open(f'{home_path}/Dropbox/personal/notes/{note_name}.md')
    text = file.read()
    file.close()
    internal_link_regex = r'\[\[(.*?)\]\]+'
    # Get links and remove duplicates
    links = list(set(re.findall(internal_link_regex, text)))
    return links


def main(note_name=''):
    """
    Main function
    """

    links = find_links(note_name)
    graph = {name: find_links(name) for name in links}
    for key, value in graph.items():
        print(colored(key, 'blue'))
        for each in value:
            print(colored(f'\t{each}', 'green'))


if __name__ == '__main__':
    fire.Fire(main)
