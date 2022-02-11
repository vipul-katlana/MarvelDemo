//
//  CharacterListViewController.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    //MARK: IBOutlet & Constant
    @IBOutlet weak private var tblView: UITableView!
    
    lazy var viewModel: CharacterListViewModel = {
        return CharacterListViewModel()
    }()
    
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Character List"
        self.callCharacterListAPI()
        self.setTableViewMethod()
    }
    
    //MARK: Class Instance
    class func instance() -> CharacterListViewController? {
        return UIStoryboard(name: StoryboardIdentifier.main, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifier.characterListController) as? CharacterListViewController
    }
    
    //MARK: Class Methhod
    
    /// Set tableview delegate ,datasource and redirection
    func setTableViewMethod() {
        self.tblView.delegate = viewModel
        self.tblView.dataSource = viewModel
        viewModel.redirectionClouser = { characterId in
            if let characterDetailsController = CharacterDetailsViewController.instance() {
                characterDetailsController.characterId = characterId
                self.present(characterDetailsController, animated: true, completion: nil)
            }
        }
    }
}


//MARK: API Call
extension CharacterListViewController {
    
    func callCharacterListAPI() {
        viewModel.getCharacterListData { (success,error) in
            DispatchQueue.main.async {
                if success {
                    self.tblView.reloadData()
                }else {
                    self.displayAlert(msg: error)
                }
            }
        }
    }
}
