* See `man man`
  * Often man pages on things like `ls` or `chflags` will say "see chflags(2)". This means that you would enter `man 2 chflags`. As explained in `man man`, the 2 is the section number. 
* `set extended_glob`
  * Allows for more file completion operators
    * `echo ^*.(tif|xml)` find all NON tif or xml files

* `chmod 755 $(find /path/to/base/dir -type d)`
* `chmod 644 $(find /path/to/base/dir -type f)`
  * Give all directories the standard permissions
  * Make all files read only
  * Executable files will show up with asterisk. Needed if you're making executables obviously.
  * Or, to reduce chmod spawning:
    * `find /path/to/base/dir -type d -print0 | xargs -0 chmod 755`
    * `find /path/to/base/dir -type f -print0 | xargs -0 chmod 644`
  * Yet another way: `find /path/to/base/dir -type d -exec chmod 755 {} +`
    * Doesn't behave as expected in zsh
