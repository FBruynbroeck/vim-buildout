python << EOF
import os
import sys


def appendSysPathByPath(path):
    if not path in sys.path:
        sys.path.append(path)

currentpath = os.getcwd().split('/')
for i in range(len(currentpath), -1, -1):
    position = len(currentpath) - i
    if position:
        currentpath = currentpath[0:-position]
    path = "/".join(currentpath)
    if os.path.isdir(os.path.join(path, 'plone3')):
        path = os.path.join(path, 'plone3')
    elif os.path.isdir(os.path.join(path, 'plone4')):
        path = os.path.join(path, 'plone4')
    path = os.path.join(path, 'parts', 'omelette')
    if os.path.isdir(path):
        appendSysPathByPath(path)
        break
EOF
