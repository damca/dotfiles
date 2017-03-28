`man man`. Often man pages on things like `ls` or `chflags` will say "see chflags(2)". This means that you would enter `man 2 chflags`. As explained in `man man`, the 2 is the section number. 

`setopt extended_glob`. Allows for more file completion operators. 
`echo ^*.(tif|xml)` Find all NON tif or xml files. 
`for i in c[0-9]; do; (cd $i; cd data_final; mkdir ~/git/lat/$i; echo *.(tif|xml); cp *.(tif|xml) ~/git/lat/$i); echo $PWD; done`. Find each directories with c[some number]. Open a subshell with parentheses; which exits back to the CD after closing paranetheses. Go into the data_final folder, make a new dir, copy all tif and xml files to it

`chmod 755 $(find /path/to/base/dir -type d)` Give all directories the standard permissions
`chmod 644 $(find /path/to/base/dir -type f)` Make all files read only. Executable files will show up with asterisk. Needed if you're making executables obviously. Or, to reduce chmod spawning:
`find /path/to/base/dir -type d -print0 | xargs -0 chmod 755`
`find /path/to/base/dir -type f -print0 | xargs -0 chmod 644`
`find /path/to/base/dir -type d -exec chmod 755 {} +`. Doesn't behave as expected in zsh

`[[ -f file ]] && echo YES` [[]] is the conditional operator. If the file is present, will echo.

`ack -l 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'`

`find /dir1 -mindepth 2 -type f -exec mv -i '{}' /dir1 ';'` Flatten a directory

`for i in *; do; (cd $i; tag --list $i.tif -N | xargs -0 -I % tag -a % ../$i); done`
