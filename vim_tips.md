# Some vim macros
## Make a list
*  `'k0"pywndt "ppa. jk0x@Q`
    1.  Setup: place a 0 somewhere. Clear register q with qqq.
    2.  Go to mark k.  Increment the number. Go to beginning of line (when incrementing 9 to 10, the one is inserted before).
        Copy the word to register p. Go to next search item. Delete until the space. Paste contents of register p. 
        After number put a '. '. Escape (jk). Go to beginning of line and delete the space. Execute register q (makes recursive)
