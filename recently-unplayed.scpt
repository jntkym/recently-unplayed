set rslt to {}
tell application "iTunes"
  set all_playlists to the name of every user playlist
  repeat with i from 1 to length of all_playlists
    if not item 1 of all_playlists = "Recently Unplayed" then
      set thePlaylist to make new playlist with properties {name:"Recently Unplayed"}
      exit repeat
    end if
  end repeat
  delete every track of playlist "Recently Unplayed"

  repeat with i from 1 to length of songs_list
    set pd to played date of track i
    set end of rslt to {name of track i, (date string of (pd))}
  end repeat
                                            
  // 日付が新しい順に配列を並び替える
  // 上位n位までを取り出す
  // その配列からplaylistを作る

end tell
