#!/usr/bin/python3
import sys
css_file = "styles.css"
css_line = '<link rel="stylesheet" type="text/css" href="styles.css"/>'
inline_css = ('<style type="text/css">\n' +
              open(css_file, encoding="utf-8").read() +
              '\n</style>\n')
sys.stdout.write(
    sys.stdin.read().replace(css_line, inline_css))

