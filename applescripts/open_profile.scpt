tell application "Terminal"
    set old to name of current settings of selected tab of window 1
    set current settings of selected tab of window 1 to settings set "Classic Dark"
end tell

set s1 to "COLORSCHEME=\"" & old & "\""
set e1 to "echo " & s1 
set ex1 to "export " & s1
tell application "Terminal" to do script e1 & ";" & ex1 in window 1

