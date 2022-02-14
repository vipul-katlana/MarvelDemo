//
//  CharacterListModel.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation

struct CharacterResponse: Codable {
    var code: Int?
    var status: String?
    var data: CharacterData?
}

struct CharacterData: Codable {
    var results: [CharacterResult]
}

struct CharacterResult: Codable {
    var name: String?
    var description: String?
    var thumbnail: CharacterThumbnail?
    var urls: [CharacterURl]?
    var id: Int?
}

struct CharacterThumbnail: Codable {
    var path: String?
    var extension_key: String?
    private enum CodingKeys : String, CodingKey {
        case path, extension_key = "extension"
    }
}

struct CharacterURl: Codable {
    var url: String?
}
