//
//  ViewController.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let characterListController = CharacterListViewController.instance() {
            let navigationControler = UINavigationController(rootViewController: characterListController)
            AppConstant.appDelegate.window?.rootViewController = navigationControler
        }
    }
}

