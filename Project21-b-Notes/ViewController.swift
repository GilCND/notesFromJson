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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newNote))
        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = note.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailsViewController {
            let note = notes[indexPath.row]
            viewController.selectedNote = note.body
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func saveNote() {

    }
    func loadData(){
        apiService.getData(Url: "https://gist.githubusercontent.com/GilCND/a36617c98504feb74eef505eb7beefe5/raw/6dcb44754948a3b61f76fc09bd5a7401ee1f2c65/notes.json") { (dataFromAPI: NotesResponse) in
            self.notes = dataFromAPI.results
            self.tableView.reloadData()
        }
    }
}

