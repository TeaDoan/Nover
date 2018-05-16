//
//  Playlist.swift
//  Equatable Pratcice  ( Unit 3)
//
//  Created by Thao Doan on 5/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import Foundation

class Playlist : Codable{
    var name : String
    var songs : [Song]
    
    init(name: String, songs : [Song] = [] ){
    self.name = name
    self.songs = songs
    
    }
}

extension Playlist: Equatable {
    
   static  func == (lhs: Playlist, rhs: Playlist ) -> Bool {
    
    return lhs.name == rhs.name && lhs.songs == rhs.songs
        
    }
}
