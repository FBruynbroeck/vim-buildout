python << EOF
import os
import sys
import re


def appendSysPathByPath(path):
    if os.path.isfile(path):
        with open(path) as f:
            lines = ''.join(f.readlines())
            exports = re.findall(r"'\/([A-Za-z0-9_\./\\-]*)'", lines)
            for export in exports:
                sys.path.append('/%s' % export)
    if os.path.isdir(path):
        sys.path.append(path)


currentpath = os.getcwd().split('/')
for i in range(len(currentpath), -1, -1):
    position = len(currentpath) - i
    if position:
        currentpath = currentpath[0:-position]
    path = os.path.join("/".join(currentpath), 'parts', 'omelette')
    appendSysPathByPath(path)
    bintest = os.path.join("/".join(currentpath), 'bin', 'test')
    appendSysPathByPath(bintest)
EOF
