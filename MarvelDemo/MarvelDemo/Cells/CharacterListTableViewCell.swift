//
//  CharacterListTableViewCell.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {
    
    //MARK: IBOutlet & Conatants
    @IBOutlet weak private var imgIcon: UIImageView!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblDesc: UILabel!
    
    //MARK: Cell LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: Cell Methods
    /// Set the cell data
    /// - Parameter data: character result object
    func setData(data: CharacterResult) {
        self.lblTitle.text = data.name ?? ""
        self.lblDesc.text = data.description ?? ""
        self.imgIcon.imageFromServerURL(("\(data.thumbnail?.path ?? "").\(data.thumbnail?.extension_key ?? "")"), placeHolder: UIImage(named: "placeholder_image"))
    }
}
