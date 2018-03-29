set a to {}
tell application "Terminal"
    repeat with i from 1 to count settings set
        set temp to {settings set i's name, settings set i's id}
        set end of a to temp
    end repeat
    tell application "Terminal" to do script "echo " & a in window 1
end tell

tell application "Terminal"
    -- set old to startup settings
    set old to settings set's name
    set current settings of selected tab of window 1 to settings set "Classic Dark"
end tell

-- tell application "Terminal" to do script "echo " & old in window 1

