set rslt to {}
tell application "iTunes"
  set all_playlists to the name of every user playlist
  // if all_playlistsの中に"Recently Unplayed"というプレイリストがなければ
    set thePlaylist to make new playlist with properties {name:"Recently Unplayed"}
  // end if
  delete every track of playlist "Recently Unplayed"

  // これを2次元配列にする
  repeat with i from 1 to length of songs_list
    set end of rslt to played data of track i
  end repeat
  
  // 日付が新しい順に配列を並び替える
  // 上位n位までを取り出す
  // その配列からplaylistを作る

end tell
