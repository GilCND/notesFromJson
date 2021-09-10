//
//  DetailsViewController.swift
//  Project21-b-Notes
//
//  Created by Felipe Gil on 2021-09-08.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var selectedNote: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedNote = selectedNote else { return }
        textLabel.text = selectedNote
    }
}
