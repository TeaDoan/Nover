//
//  NotesTableViewController.swift
//  ImNote
//
//  Created by Thao Doan on 12/26/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var notes = [Notes]()
    var managedOjectContext: NSManagedObjectContext!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        managedOjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadData() {
        let noteRequest:NSFetchRequest<Notes> = Notes.fetchRequest()
        do {
            notes = try managedOjectContext.fetch(noteRequest)
            self.tableView.reloadData()
        }catch {
            print("You have an Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NoteTableViewCell
        
        let noteItem = notes[indexPath.row]
        
        
        if let noteImage = UIImage(data: noteItem.image as! Data ) {
            
            cell.backgroundImageView.image = noteImage
        }
        cell.nameLabel.text = noteItem.name
        
        cell.descriptionLabel.text = noteItem.longText
        
        return cell
    }
    
    @IBAction func addNote(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            picker.dismiss(animated: true, completion: nil)
            self.createNoteItem(with: image)
        }
    }
    func createNoteItem(with image:UIImage)   {
        let noteItem = Notes(context: managedOjectContext)
        
        noteItem.image = NSData(data: UIImageJPEGRepresentation(image, 0.3)!) as Data
        
        
        let alert = UIAlertController(title: "New Note", message: "Enter place and description", preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "Place"
            
            
        }
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "Description"
        
    }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {(action:UIAlertAction) in
            let nameField = alert.textFields?.first
            
            let descriptionField = alert.textFields?.last
            
            if nameField?.text != "" && descriptionField?.text != ""{
                noteItem.name = nameField?.text
                noteItem.longText = nameField?.text
                do {
                    try self.managedOjectContext.save()
                }catch{
                    print("Error")
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
