//
//  APIService.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchCharacterList( completion: @escaping ( _ success: Bool, _ characterResult: [CharacterResult]?, _ error: Error? )->() )
    func fetchCharacterDetails( request: CharacterDetailsModel,completion: @escaping ( _ success: Bool, _ characterResult: [CharacterResult]?, _ error: Error? )->() )
}

private let sessionManager: URLSession = {
    let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
    return URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: nil)
}()


class APIService: APIServiceProtocol {
    
    //MARK: Method
    ///Method used to get character list data
    func fetchCharacterList( completion: @escaping ( _ success: Bool, _ characterResult: [CharacterResult]?, _ error: Error? )->() ) {
        GlobalUtility.showHud()
        let urlComponents = UrlComponents(path: "v1/public/characters")
        let request = URLRequest(url: urlComponents.url)
        sessionManager.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                GlobalUtility.hideHud()
                completion( false,[], error )
                return
            }
            let response = try? JSONDecoder().decode(CharacterResponse.self, from: data!)
            if(response?.code == 200) {
                GlobalUtility.hideHud()
                completion( true, response?.data?.results, nil )
            }
            else{
                GlobalUtility.hideHud()
                completion( false,[], error )
            }
        }.resume()
        
    }
    
    ///Method used to get character details data
    func fetchCharacterDetails(request: CharacterDetailsModel, completion: @escaping (Bool, [CharacterResult]?, Error?) -> ()) {
        GlobalUtility.showHud()
        let urlComponents = UrlComponents(path: "v1/public/characters/\(request.characterId)")
        let request = URLRequest(url: urlComponents.url)
        sessionManager.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                GlobalUtility.hideHud()
                completion( false,[], error )
                return
            }
            let response = try? JSONDecoder().decode(CharacterResponse.self, from: data!)
            if(response?.code == 200) {
                GlobalUtility.hideHud()
                completion( true, response?.data?.results, nil )
            }
            else{
                GlobalUtility.hideHud()
                completion( false,[], error )
            }
        }.resume()
    }
}
