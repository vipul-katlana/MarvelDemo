//
//  GlobalUtility.swift
//  MarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation
import UIKit

@objc class GlobalUtility: NSObject {
    
    //MARK: Class Instance
    static let shared: GlobalUtility = {
        let instance = GlobalUtility()
        return instance
    }()
    
    //MARK: Class Methhod
    
    /// showHud to show the loader
    static func showHud() {
        DispatchQueue.main.async {
            let aStoryboard = UIStoryboard(name: StoryboardIdentifier.loader, bundle: nil)
            let aVCObj = aStoryboard.instantiateViewController(withIdentifier: ViewControllerIdentifier.loaderController) as! LoaderViewController
            let aParent = AppConstant.appDelegate.window
            aVCObj.view.frame = UIScreen.main.bounds
            aVCObj.view.tag  = 10000
            aParent?.addSubview(aVCObj.view)
        }
        
    }
    
    /// hideHud to hide the loader
    static func hideHud() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let aParent = AppConstant.appDelegate.window
            for view in (aParent?.subviews)! {
                if view.tag == 10000 {
                    view.removeFromSuperview()
                }
            }
        }
    }
}


