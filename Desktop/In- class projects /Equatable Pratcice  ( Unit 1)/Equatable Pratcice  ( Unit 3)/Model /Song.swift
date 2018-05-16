//
//  Song.swift
//  Equatable Pratcice  ( Unit 3)
//
//  Created by Thao Doan on 5/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import Foundation


class Song : Equatable, Codable {
    
    var artist : String
    var name : String
    init(artist: String, name: String) {
        
        self.artist = artist
        self.name = name
        
    }
    
    static func ==(lhs :Song , rhs:Song) -> Bool {
        return lhs.artist == rhs.artist && lhs.name == rhs.name
    }
    

}
