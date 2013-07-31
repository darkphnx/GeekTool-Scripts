tell application "System Events"  
    set processList to (name of every process)  
end tell  
if processList contains "Mail" then  
    tell application "Mail"  
        if (unread count of inbox) > 0 then  
            set messageList to (messages of inbox) whose read status is false  
            set output to ""  
            repeat with itemNum from 1 to (unread count of inbox)  
                set output to output & (extract name from sender of item itemNum of messageList) & ": " & subject of item itemNum of messageList & return  
            end repeat  
        end if  
    end tell  
else  
    set output to "Mail not open :("  
end if  
