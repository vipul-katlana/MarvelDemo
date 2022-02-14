//
//  APIServiceTest.swift
//  MarvelDemoTests
//
//  Created by Vipul  on 11/02/22.
//

import Foundation
import XCTest
@testable import MarvelDemo

class APIServiceTest: XCTestCase {
    
    var APIServiceObject: APIService?
    
    override func setUp() {
        super.setUp()
        APIServiceObject = APIService()
    }
    
    override func tearDown() {
        APIServiceObject = nil
        super.tearDown()
    }
    
    func testCharacterListAPI() {
        let APIServiceObject = self.APIServiceObject!
        let expect = XCTestExpectation(description: "callback")
        APIServiceObject.fetchCharacterList { (success, characterResult, error) in
            expect.fulfill()
            if let characterData = characterResult {
                for story in characterData {
                    XCTAssertNotNil(story)
                }
            }
        }
        wait(for: [expect], timeout: 3.1)
    }
    
    func testCharacterDetailsAPI() {
        let APIServiceObject = self.APIServiceObject!
        let expect = XCTestExpectation(description: "callback")
        let request = CharacterDetailsModel(characterId: "1011334")
        APIServiceObject.fetchCharacterDetails(request: request) { (success, characterResult, error) in
            expect.fulfill()
            if let characterData = characterResult {
                for story in characterData {
                    XCTAssertNotNil(story)
                }
            }
        }
        wait(for: [expect], timeout: 3.1)
    }
}

