//
//  SongModelController.swift
//  Equatable Pratcice  ( Unit 3)
//
//  Created by Thao Doan on 5/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import Foundation

class SongModelController {
    
  static  func  createSongWith(artist: String, name : String, to playlist: Playlist) {
        
        let song = Song(artist: artist, name: name)
        PlaylistController.sharedController.addSongTo(playlist: playlist, song: song)
    
        PlaylistController.sharedController.save()
        
    
    }
    
    static func delete(song:Song, fromA playlist:Playlist) {
        
        guard let index = playlist.songs.index(of: song) else {return}
        
        playlist.songs.remove(at: index)
    }
}
