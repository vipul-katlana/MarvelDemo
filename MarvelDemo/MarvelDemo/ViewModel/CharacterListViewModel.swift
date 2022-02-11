//
//  CharacterListViewModel.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//


import Foundation
import UIKit

class CharacterListViewModel: NSObject {
    
    //MARK: Constant
    private let apiService: APIServiceProtocol
    var characterListArray: [CharacterResult] = [CharacterResult]()
    
    var redirectionClouser: ((String)->())?
    
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
}

//MARK: TableviewDelegate & TableviewDataSource
extension CharacterListViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.characterTableCell, for: indexPath) as! CharacterListTableViewCell
        cell.setData(data: self.characterListArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if redirectionClouser != nil {
            redirectionClouser!("\(self.characterListArray[indexPath.row].id ?? 0)")
        }
    }
}
