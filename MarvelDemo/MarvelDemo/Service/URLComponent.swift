//
//  URLComponent.swift
//  OpenBankMarvelDemo
//
//  Created by Vipul  on 10/02/22.
//

import Foundation

class UrlComponents {
    let path: String
    var url: URL {
        var query = [String]()
        query.append("apikey=\(AppConstant.publicKey)")
        let hashGenerate = "".MD5(string: "\(AppConstant.timeStamp)\(AppConstant.privateKey)\(AppConstant.publicKey)").map { String(format: "%02hhx", $0) }.joined()
        query.append("hash=\(hashGenerate)")
        query.append("ts=\(AppConstant.timeStamp)")
        guard let composedUrl = URL(string: "?" + query.joined(separator: "&"), relativeTo: NSURL(string: AppConstant.baseUrl + path + "?") as URL?) else {
            fatalError("Unable to build request url")
        }
        return composedUrl
    }
    init(path: String) {
        self.path = path
    }
}
