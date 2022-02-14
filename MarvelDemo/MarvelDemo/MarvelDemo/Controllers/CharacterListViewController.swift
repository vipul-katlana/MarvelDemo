//
//  CharacterListViewController.swift
//  MarvelDemo
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
    }
    
    //MARK: Class Instance
    class func instance() -> CharacterListViewController? {
        return UIStoryboard(name: StoryboardIdentifier.main, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifier.characterListController) as? CharacterListViewController
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

//MARK: TableviewDelegate & TableviewDataSource
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.characterListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.characterTableCell, for: indexPath) as! CharacterListTableViewCell
        cell.setData(title: self.viewModel.getName(index: indexPath.row), description: self.viewModel.getDescription(index: indexPath.row), imageUrl: self.viewModel.getImage(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let characterDetailsController = CharacterDetailsViewController.instance() {
            characterDetailsController.characterId = "\(self.viewModel.characterListArray[indexPath.row].id ?? 0)"
            self.present(characterDetailsController, animated: true, completion: nil)
        }
    }
}
