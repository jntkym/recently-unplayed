set myList to {{"a", "2"}, {"b", "1"}, {"c", "3"}, {"d", "0"}}
set ListRef to a reference to myList
set num to length of ListRef
repeat
  set flg to false
  repeat with i from 1 to num - 1
    set lft to item i of ListRef
    set rgt to item (i + 1) of ListRef
      if lft < rgt then
        set item i of ListRef to rgt
        set item (i + 1) of ListRef to lft
        set flg to true
      end if
  end repeat
  set num to i
  if flg is false then
    exit repeat
  end if
end repeat
display dialog ListRef
