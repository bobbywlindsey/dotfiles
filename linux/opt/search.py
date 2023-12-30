"""
Search markdown notes.

This code should be put in your PATH variable
and an alias should point to it.
"""

import re
from os import listdir, environ
from os.path import isfile, join
import fire
from termcolor import colored


def search(search_term=''):
    """
    Case-insensitive search through all
    markdown notes.
    """
        
    if type(search_term) != str:
        search_term = str(search_term)
    home_path = environ['HOME']
    path = f'{home_path}/Dropbox/personal/external-brain/'
    notes = [f for f in listdir(path) if isfile(join(path, f)) if f.endswith('.md')]
    notes.sort()

    for note in notes:
        file = open(f'{path}{note}')
        text = file.read()
        text = text.replace('\n', ' ')
        file.close()
        indices = [m.span() for m in re.finditer(search_term, text, re.IGNORECASE)]
        for index in indices:
            # Try overall context window
            try:
                search_match = colored(text[index[0]:index[1]], 'green')
                left_context = text[index[0]-40:index[0]]
                right_context = text[index[1]:index[0]+40]
                search_output = left_context + search_match + right_context
                print(colored(f'{note}', 'blue') + f': {search_output}')
                continue
            except:
                pass
            # If above fails, try just right context window
            try:
                search_match = colored(text[index[0]:index[1]], 'green')
                right_context = text[index[1]:index[0]+40]
                search_output = search_match + right_context
                print(colored(f'{note}', 'blue') + f': {search_output}')
                continue
                pass
            except:
                pass
            # If above fails, try just left context window
            try:
                search_match = colored(text[index[0]:index[1]], 'green')
                left_context = text[index[0]-40:index[0]]
                search_output = left_context + search_match
                print(colored(f'{note}', 'blue') + f': {search_output}')
                continue
                pass
            except:
                pass
            # If all fails, just return matches without context
            try:
                search_match = colored(text[index[0]:index[1]], 'green')
                search_output = search_match
                print(colored(f'{note}', 'blue') + f': {search_output}')
                continue
            except:
                raise Exception('Something went wrong')
    # if not links:
    #     print(colored('No links found.', 'yellow'))
    # for link in links:
    #     print(link)


if __name__ == '__main__':
    fire.Fire(search)
