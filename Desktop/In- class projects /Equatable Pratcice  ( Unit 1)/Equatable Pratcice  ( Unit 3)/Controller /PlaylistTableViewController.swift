//
//  PlaylistTableViewController.swift
//  Equatable Pratcice  ( Unit 3)
//
//  Created by Thao Doan on 5/9/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     PlaylistController.sharedController.playlists = PlaylistController.sharedController.load()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedController.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "show", for: indexPath)

        let playlist = PlaylistController.sharedController.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "Song:\(playlist.songs.count)"

        return cell
    }
 

   


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // get the playlist that we want to delete.
            let playlist  = PlaylistController.sharedController.playlists[indexPath.row]
            
            
            PlaylistController.sharedController.delete(playlist: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
           
        }    
    }
    
    @IBOutlet weak var playlistTextField: UITextField!
    
   
    @IBAction func addButtonClick(_ sender: UIBarButtonItem) {
        
        guard let playlistName = playlistTextField.text, !playlistName.isEmpty  else {return }
            
            PlaylistController.sharedController.create(playlist: playlistName)
        
            playlistTextField.text = "" // this is clear
        
            tableView.reloadData()
        
        }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check the identifier of the seg
        if segue.identifier == "toSongDetailVC" {
            guard let destinationVC = segue.destination as? SongTableViewController else {return}
                
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let newSong = PlaylistController.sharedController.playlists[indexPath.row]
                
                destinationVC.playlist = newSong
                
                
            }
            
        }
    }
    

}

