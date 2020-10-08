import subprocess
import sys
import re
import pprint
pp = pprint.PrettyPrinter(indent=4)

def derived_class(base_name, path):
    cmd = f"rg '(class|struct).*:.*(public|private|protected)\W*{base_name}\s*' -t cpp --no-filename {path}"
    content = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True).stdout.read()
    #print(f'the search content is {content}')
    pattern = re.compile(r'(class|struct)(\w*)(\W*)(\w*)(final){0,1}')
    lines = content.splitlines()
    ret = []
    for line in lines:
        line = str(line)
        m = re.search(pattern, str(line))
        if m:
            name = m.group(4)
            if name.strip() != base_name:
                ret.append(name.strip())
    return ret

def derive_graph(base_name, path, vist_set):
    q = [base_name]
    ret = []
    while q:
        base_name = q.pop()
        if base_name not in vist_set:
            vist_set.append(base_name)
            subs = derived_class(base_name, path)
            ret.append({
                'name': base_name,
                'childs': subs
            })
            for sub in subs:
                if sub not in vist_set:
                    q.append(sub)
    return ret


def build_dot_graph(derive):
    for item in derive:
        if item['childs']:
            name = item['name']
            childs = '\n' + ';\n'.join([f'    {x}' for x in item['childs']]) + '\n'
            print(f'{name} -> {{{childs}}}')

#derives = derived_class('IStorage', '/opt/github/ClickHouse')
#print(derives)
derive_graph = derive_graph('BufferBase', '/opt/github/ClickHouse', [])

build_dot_graph(derive_graph)
#print(derives)
