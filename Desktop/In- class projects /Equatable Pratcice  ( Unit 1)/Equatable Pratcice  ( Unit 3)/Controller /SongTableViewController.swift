//
//  SongTableViewController.swift
//  Equatable Pratcice  ( Unit 3)
//
//  Created by Thao Doan on 5/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBOutlet weak var songTextFiled: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songs", for: indexPath)
        guard let song = playlist?.songs[indexPath.row] else { return  UITableViewCell()}
        
        
            cell.textLabel?.text = song.name
           cell.detailTextLabel?.text = song.artist
            


        // Configure the cell...

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
//            let songAtPlaylistToDelete = PlaylistController.sharedController.playlists[indexPath.row]
//            guard let  songToDetele = playlist?.songs[indexPath.row] else {return}
//
            guard let unwrappedPlaylist = playlist, let songToDelete = playlist?.songs[indexPath.row] else {return}
            SongModelController.delete(song: songToDelete, fromA: unwrappedPlaylist)

            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
          
    }
    }

    @IBAction func addNewSongButtonClicked(_ sender: Any) {
        
        guard let artist = artistTextField.text, !artist.isEmpty,
        let name = songTextFiled.text, name != "" ,
        let unrappedPlaylist = playlist else {return}
        SongModelController.createSongWith(artist: artist, name: name, to: unrappedPlaylist)
        artistTextField.text = ""
        songTextFiled.text = ""
        tableView.reloadData()
    }
    
    

    
   
}
