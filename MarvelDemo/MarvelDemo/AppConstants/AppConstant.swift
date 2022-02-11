//
//  AppConstant.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation
import UIKit

//MARK: Storyboard Identifier
struct StoryboardIdentifier {
    static var main = "Main"
    static var loader = "Loader"
}

//MARK: ViewController Identifier
struct ViewControllerIdentifier {
    static var characterListController = "CharacterListViewController"
    static var loaderController = "LoaderViewController"
    static var characterDetails = "CharacterDetailsViewController"
}

//MARK: TableCell Identifier
struct CellIdentifier {
    static var characterTableCell = "CharacterListTableViewCell"
}

//MARK: Application Constant
struct AppConstant {
    static let appName = "MarvelDemo"
    static let appDelegate = UIApplication.shared.delegate  as? AppDelegate ?? AppDelegate()
    static let baseUrl = "https://gateway.marvel.com:443/"
    static let publicKey = "358fc4b40d07d24ef760d5d6fbaca2dc"
    static let privateKey = "91d65833607a886739a2fca3dc35ac6931c2ae5e"
    static let timeStamp = "1"
}
