//
//  CharacterListViewModel.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//


import Foundation
import UIKit

class CharacterListViewModel: NSObject {
    
    //MARK: Constant
    private let apiService: APIServiceProtocol
    var characterListArray: [CharacterResult] = [CharacterResult]()
    
    
    //MARK: Initilize Service Object
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    //MARK: Class Method
    ///Method used to fetch data from server 
    func getCharacterListData( completion: @escaping ( _ success: Bool, _ error: String?)->()) {
        apiService.fetchCharacterList { (success, data, error) in
            if success {
                if let characterData = data {
                    self.characterListArray = characterData
                    completion(true, nil)
                }else {
                    completion(false, error?.localizedDescription)
                }
            }else {
                completion(false, error?.localizedDescription)
            }
        }
    }
    
    /// Method used to get name of character
    /// - Parameter index: index path of cell
    /// - Returns: name of character
    func getName(index: Int)-> String {
        return self.characterListArray[index].name ?? ""
    }
    
    /// Method used to get description of character
    /// - Parameter index: index path of cell
    /// - Returns: description of character
    func getDescription(index: Int)-> String {
        return self.characterListArray[index].description ?? ""
    }
    
    /// Method used to get thumbnail image of character
    /// - Parameter index: ndex path of cell
    /// - Returns: thhumbnail image of character
    func getImage(index: Int)-> String {
        return "\(self.characterListArray[index].thumbnail?.path ?? "").\(self.characterListArray[index].thumbnail?.extension_key ?? "")"
    }
}

