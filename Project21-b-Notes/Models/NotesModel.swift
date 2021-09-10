//
//  notesModel.swift
//  Project21-b-Notes
//
//  Created by Felipe Gil on 2021-09-09.
//

import Foundation

struct NotesResponse: Decodable {
    let results: NotesModel
}

struct NotesModel: Decodable, Identifiable {
    public let id: Int
    public let noteName: String
    public let noteBody: String
    public let dateCreated: String
    
    private enum CodingKeys: String, CodingKey {
        case id, noteName, noteBody, dateCreated
    }
}
