//
//  CharacterDetailsViewController.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    //MARK: IBOutlet & Constant
    @IBOutlet private weak var imgIcon: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblDescripition: UILabel!
    
    var characterId : String?
    lazy var viewModel: CharacterDetailsViewModel = {
        return CharacterDetailsViewModel()
    }()
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = CharacterDetailsModel(characterId: self.characterId ?? "")
        self.callCharacterDetailsAPI(request: request)
    }
    
    //MARK: Class Instance
    class func instance() -> CharacterDetailsViewController? {
        return UIStoryboard(name: StoryboardIdentifier.main, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifier.characterDetails) as? CharacterDetailsViewController
    }
    
    //MARK: Class Method
    /// Method used to set data
    func setData() {
        self.imgIcon.imageFromServerURL("\(self.viewModel.characterListArray.first?.thumbnail?.path ?? "").\(self.viewModel.characterListArray.first?.thumbnail?.extension_key ?? "")", placeHolder: UIImage(named: "placeholder_image"))
        self.lblTitle.text = self.viewModel.characterListArray.first?.name ?? ""
        self.lblDescripition.text = self.viewModel.characterListArray.first?.description ?? ""
        if self.viewModel.characterListArray.first?.description ?? "" == "" {
            self.lblDescripition.text = "No Description"
        }
    }
}

//MARK: API Call
extension CharacterDetailsViewController {
    func callCharacterDetailsAPI(request: CharacterDetailsModel) {
        viewModel.getCharacterDetailsData(request: request) { (success,error) in
            DispatchQueue.main.async {
                if success {
                    self.setData()
                }else {
                    self.displayAlert(msg: error)
                }
            }
        }
    }
}
