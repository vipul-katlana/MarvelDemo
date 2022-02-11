//
//  UIViewController+Extension.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayAlert( msg: String?, ok: String = "Ok", okAction: (() -> Void)? = nil){
        let alertController = UIAlertController(title:  "\(AppConstant.appName)", message: msg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: ok, style: .default)
        { (action) in
            if let okAction = okAction {
                DispatchQueue.main.async(execute: {
                    okAction()
                })
            }
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
