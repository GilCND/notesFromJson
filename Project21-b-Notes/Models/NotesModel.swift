//
//  notesModel.swift
//  Project21-b-Notes
//
//  Created by Felipe Gil on 2021-09-09.
//

import Foundation

struct NotesResponse: Decodable {
    let results: [NotesModel]
    
}

struct NotesModel: Decodable, Identifiable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        body = try container.decode(String.self, forKey: .body)
        date = try container.decode(String.self, forKey: .date)
    }
    
    public let id: Int
    public let name: String
    public let body: String
    public let date: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, body, date
    }
}
