//
//  CharacterDetailsViewModel.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation
import UIKit

class CharacterDetailsViewModel {
    
    //MARK: Constant
    private let apiService: APIServiceProtocol
    var characterListArray: [CharacterResult] = [CharacterResult]()
    
    //MARK: Initilize Service Object
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    //MARK: Class Method
    ///Method used to fetch data from server
    func getCharacterDetailsData(request: CharacterDetailsModel, completion: @escaping ( _ success: Bool, _ error: String?)->()) {
        apiService.fetchCharacterDetails(request: request) { (success, data, error) in
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
    
}

