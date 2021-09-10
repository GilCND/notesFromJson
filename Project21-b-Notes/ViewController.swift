//
//  ViewController.swift
//  Project21-b-Notes
//
//  Created by Felipe Gil on 2021-09-08.
//

import UIKit

class ViewController: UITableViewController {
    var apiService = ApiService()
    var notes: [NotesModel] = []
    var idArray: [Int] = []
    var noteNameArray: [String] = []
    var noteBodyArray: [String] = []
    var dateCreatedArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newNote))
        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = note.noteBody
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailsViewController {
            let note = notes[indexPath.row]
            viewController.selectedNote = note.noteBody
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func saveNote() {

    }
    func loadData(){
        apiService.getData(Url: "https://gist.githubusercontent.com/GilCND/a36617c98504feb74eef505eb7beefe5/raw/d98321ba9599029b3538ab9c00f4de45f136d814/notes.json") { (dataFromAPI: NotesModel) in
            self.notes = [dataFromAPI]
            self.idArray.append(dataFromAPI.id)
            self.noteNameArray.append(dataFromAPI.noteName)
            self.noteBodyArray.append(dataFromAPI.noteBody)
            self.dateCreatedArray.append(dataFromAPI.dateCreated)
            self.tableView.reloadData()
        }
    }
    
}

