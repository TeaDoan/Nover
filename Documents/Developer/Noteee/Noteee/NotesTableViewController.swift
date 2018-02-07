//
//  NotesTableViewController.swift
//  Noteee
//
//  Created by Thao Doan on 12/28/17.
//  Copyright © 2017 Thao Doan. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var notes = [Notes]()
    var managedObjectContext : NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        loadData()

       
    }
    func loadData(){
        let noteRequest: NSFetchRequest<Notes> = Notes.fetchRequest()
        
        do{
            notes = try managedObjectContext.fetch(noteRequest)
            self.tableView.reloadData()
        }catch {
            print("You have an error")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotesTableViewCell
        let noteItem = notes[indexPath.row]
        if let noteImage = UIImage(data: noteItem.image as! Data) {
            cell.backgoundImageView.image = noteImage
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
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            self.createNoteItem(with: image)
        }
        
    }
        func createNoteItem(with image:UIImage){
            let noteItem = Notes(context: managedObjectContext)
            noteItem.image = NSData(data: UIImageJPEGRepresentation(image, 0.3)!) as Data
            let alert = UIAlertController(title: "New note", message: "Enter the place and description", preferredStyle: .alert)
            alert.addTextField {(textField : UITextField)  in  textField.placeholder = "Place"
                
        }
            alert.addTextField{(textField : UITextField) in
                textField.placeholder = "Description"
        
    }
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler:{(action:UIAlertAction) in
                let nameField = alert.textFields?.first
                let descriptionField = alert.textFields?.last
                if nameField?.text != "" && descriptionField?.text != ""{
                    noteItem.name = nameField?.text
                    noteItem.longText = nameField?.text
                    do{
                        try self.managedObjectContext.save()
                    }catch{
                        print("Error")
                    }
                }

         }))
            
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
     }
    
    
}
