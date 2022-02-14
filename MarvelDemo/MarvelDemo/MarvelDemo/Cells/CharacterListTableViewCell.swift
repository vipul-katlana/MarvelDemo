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
    func setData(title: String, description: String, imageUrl: String) {
        self.lblTitle.text = title
        self.lblDesc.text = description
        self.imgIcon.imageFromServerURL(imageUrl, placeHolder: UIImage(named: "placeholder_image"))
    }
}
