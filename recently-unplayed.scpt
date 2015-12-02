(* todo: 同じ曲名がある場合の識別はどうする? *)

property MonthText : {"jan", "feb", "mar", "april", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"}

on MonthToNum(MONTH)
  repeat with i from 1 to 12
    if item i of MonthText = MONTH as text then return i
  end repeat
  return i
end MonthToNum

on NumToTxt(NUM)
  return text -2 thru -1 of ("0" & (NUM as text))
end NumToTxt

set songList to {}
tell application "iTunes"

(* playlistの作成と初期化 *)
set all_playlists to the name of every user playlist
repeat with i from 1 to (length of all_playlists) + 1
  if i > length of all_playlists then
    set thePlaylist to make new playlist with properties {name:"Recently Unplayed"}
  else
    if item i of all_playlists = "Recently Unplayed" then
      exit repeat
    end if
  end if
end repeat
delete every track of playlist "Recently Unplayed"

(* すべてのtrack情報の取得 *)
repeat with i from 1 to (get count of tracks) 
  set pd to (played date of track i)
  set end of songList to {name of track i, pd}
end repeat

end tell 

(* 日付をYYYYMMDD記法にする *)
repeat with i from 1 to length of songList
  if item 2 of (item i of songList) = missing value then
    set item 2 of (item i of songList) to "00000000"
  else
    set dateInfo to item 2 of (item i of songList)
    set Y to (year of dateInfo) as text
    set M to NumToTxt(MonthToNum(month of dateInfo))
    set D to NumToTxt(day of dateInfo)
    set item 2 of (item i of songList) to Y & M & D
  end if
end repeat

(* 日付順にバブルソート *)
set listRef to reference to songList
set num to length of listRef
repeat
  set flg to false
  repeat with i from 1 to num - 1
    set leftPos to item i of listRef
    set rightPos to item (i + 1) of listRef
    if item 2 of leftPos > item 2 of rightPos then
      set item i of listRef to rightPos
      set item (i + 1) of listRef to leftPos
      set flg to true
    end if
  end repeat
  set num to i
  if flg = false then
    exit repeat
  end if
end repeat

(* 現在の日時を取得 *)
set Y to year of (current date) as text
set M to NumToTxt(MonthToNum(month of (current date)))
set D to NumToTxt(day of (current date))
set currentDate to Y & M & D

(* 3ヶ月以上聴いていない曲のみでリストを作成 *)
set recentlyUnplayedList to {}
repeat with i from 1 to length of listRef
  if item 2 of (item i of listRef) < currentDate - 300 then
    set end of recentlyUnplayedList to item i of listRef
  end if
end repeat

(* iTunes上にプレイリストを作成 *)
