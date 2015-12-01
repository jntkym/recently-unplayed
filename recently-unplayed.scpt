set songList to {}
tell application "iTunes"

　(* playlistの作成と初期化 *)
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

  (* すべてのtrack情報の取得 *)
  repeat with i from 1 to (get count of tracks) 
    set pd to (played date of track i)
    set end of songList to {name of track i, (date string of (pd))}
  end repeat
  
  (* 日付をYYYYMMDD記法にする *)

  (* 日付順にバブルソート *)
  set listRef to reference to songList
  set num to length of listRef
  repeat
    set flg to false
    repeat with i from 1 to num - 1
      set leftPos to item i of listRef
      set rightPos to item (i + 1) of listRef
      if item 2 of leftPost > item 2 of rightPos then
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

  (* item 2が""のものあるいは5ヶ月以上前に再生されたリストを取り出す*)

  repeat with i from 1 to size of (* nantoka *)
    (* リストのitem 1をiterateしてプレイリストに追加する *)
  end repeat
end tell
