import os
import shutil
import re

# Change the theme to ys
home = os.getenv("HOME")
shutil.move(home + '/.zshrc', home + '/.zshrc.bak')

fin = open(home + '/.zshrc.bak', 'r')
file_string = fin.read()
fin.close()

p_theme = re.compile('ZSH_THEME\S+')
new_file_string = re.sub(p_theme, 'ZSH_THEME="dustin"', file_string)

fout = open(home + '/.zshrc', 'w')
fout.write(new_file_string)
fout.write(
           'bindkey -v \n'
           'export KEYTIMEOUT=1 \n'
           'zle-line-init \n'
           )
fout.close()

