//
//  PlaylistController.swift
//  Equatable Pratcice  ( Unit 3)
//
//  Created by Thao Doan on 5/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import Foundation

class PlaylistController {
    
    // 1 : CRUD
    // 2 : source of truth
    // 3 : share instance 
    
    static let sharedController = PlaylistController()
    // this is our source of TRUTH!
    var playlists = [Playlist]()  // or var playlist:[Playlist] = []
    
    //this is for persistance
    // every time this PlaylistController gets called the load will get hit.
    init() {
        self.playlists = load()
    }
    
    //Creat C
    
    func create(playlist withName: String ) {
    
        // 1 Create an instance "Think initalizer"
        
        let playlist = Playlist(name: withName)
        
        // 2 append that instance to your source of truth
        playlists.append(playlist)
        
           save()
    }
    
    
    
    func addSongTo(playlist:Playlist,song:Song) {
        
        playlist.songs.append(song)
    }
    
    
    
   // Read C
    
    // Update
    
    func update(playlist: Playlist, newName: String) {
        playlist.name = newName
        save()
        
    }
    
    
    // Delete
    
    func delete(playlist: Playlist) {
        guard let index = playlists.index(of: playlist) else { return }
        
        playlists.remove(at: index)
        
        save()
        
    }
    
    func save() {
        
        let jsonEncoder = JSONEncoder()
        
        do {
            // This is our train. create your data
            let data = try jsonEncoder.encode(playlists)
            // this is our track. Send data to the file manager
            try data.write(to: fileUrl())
            
        } catch let error {
            
            print("Error saving to local fileURL:\(#function)\(error)\(error.localizedDescription)")
        }
    }
    
    func load() -> [Playlist] {
        let jsonDecoder = JSONDecoder()
        
        do {
            // it currently data.
            let data = try Data(contentsOf: fileUrl())
            // the date that we want to retrive 
            
            let playlists = try jsonDecoder.decode([Playlist].self, from: data)
             return playlists
            
            
            
        } catch let error {
            
            print("Error loading playlist from fileURL: \(#function)\(error)\(error.localizedDescription)")
            
            return []
        }
        
    }
    
    
    func fileUrl() -> URL {
        // each app sets up new local persistance storage. This function will help send our object to the location we want to save
        // 1) Use fileManager to get the users documenDirectory
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = paths[0]
        
        // Noew create your own customFile path
        let playlistLocation = "platlist.json" // turns our object into something that it can located
        
        let url = documentDirectory.appendingPathComponent(playlistLocation) // adds the /(back dash)
        
        print(url)
        return url
        
        
    }
    
    
}

