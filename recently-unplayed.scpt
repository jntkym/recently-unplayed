set sngs to {}
tell application "iTunes"
  set all_playlists to the name of every user playlist
  repeat with i from 1 to length of all_playlists
    if i = length of all_playlists then
      set thePlaylist to make new playlist with properties {name:"Recently Unplayed"}
    else
      if item i of all_playlists = "Recently Unplayed" then
        exit repeat
      end if
    end if
  end repeat
  delete every track of playlist "Recently Unplayed"

  repeat with i from 1 to (get count of tracks) 
    set pd to (played date of track i)
    set end of sngs to {name of track i, (date string of (pd))}
  end repeat
                                            
  // 日付が新しい順に配列を並び替える
  // 上位n位までを取り出す
  // その配列からplaylistを作る

end tell
