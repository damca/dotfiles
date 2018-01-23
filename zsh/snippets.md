# basic
* `man man`
   often man pages on things like `ls` or `chflags` will say "see chflags(2)". This means that you would enter `man 2 chflags`. As explained in `man man`, the 2 is the section number. 

# chmod
## Works on mac with zsh
* `find /path/to/base/dir -type d -print0 | xargs -0 chmod 755`
   Give all directories the standard permissions
* `find /path/to/base/dir -type f -print0 | xargs -0 chmod 644`
   Make all files read only. Executable files show up with asterisks. Needed if you're making executables obviously. Or, to reduce chmod spawning.
## Doesn't work
* `find /path/to/base/dir -type d -exec chmod 755 {} +`
* `chmod 755 $(find /path/to/base/dir -type d)`
* `chmod 644 $(find /path/to/base/dir -type f)`

# zsh
* `[[ -f file ]] && echo YES`
   `[[]]` is the conditional operator. If the file is present, will echo.
* `setopt extended_glob`
   Allows for more file completion operators. 
* `echo ^*.(tif|xml)`
   Find all NON tif or xml files. 
* `for i in c[0-9]; do; (cd $i; cd data_final; mkdir ~/git/lat/$i; echo *.(tif|xml); cp *.(tif|xml) ~/git/lat/$i); echo $PWD; done`
   Find each directories with c[some number]. Open a subshell with parentheses; which exits back to the CD after closing paranetheses. Go into the data_final folder, make a new dir, copy all tif and xml files to it

# ack
* `ack -l 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'`
   Replace all instances of 'pattern' in file contents

# misc
* `find /dir1 -mindepth 2 -type f -exec mv -i '{}' /dir1 ';'`
   Flatten a directory
* `for i in *; do; (cd $i; tag --list $i.tif -N | xargs -0 -I % tag -a % ../$i); done`
   mac tag (as in blue, topic, yellow, etc.) files. Used in Finder.
* `find . -type f -name '*configuration*' | sed -E 's|/[^/]+$||' | sort | uniq > data_dirs.txt`
   find all directories that contain a certain type of file, export to a txt file.
* `while IFS= read -r line; do; echo ; done < data_dirs.txt`
   read in a list of files from a txt file and process. IFS= dont trim leading/trailing whitespace. -r 'raw' don't interpret /
* `for i in *.png; do; sips -s format jpeg -s formatOptions best $i --out ${i:r}; done`
   convert all png to jpg in a directory
* `du -sh /dir/*`
   summarize subdirectory sizes in human readable form

