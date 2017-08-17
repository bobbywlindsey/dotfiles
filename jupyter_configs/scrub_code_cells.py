import sys
from bs4 import BeautifulSoup

def scrub_code_cells(file_name):
    file_name = file_name[:-5]
    with open(file_name + '.html', 'r') as content_file:
        content = content_file.read()
    soup = BeautifulSoup(content, 'lxml')
    [div.extract() for div in soup.findAll('div', {'class': 'input'})]
    with open(file_name + '.html', 'w') as output_file:
        output_file.write(str(soup))

scrub_code_cells(sys.argv[1])
