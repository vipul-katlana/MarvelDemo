//
//  CharacterListViewModelTest.swift
//  MarvelDemoTests
//
//  Created by Vipul  on 11/02/22.
//

import XCTest
@testable import MarvelDemo

class CharacterListViewModelTest: XCTestCase {
    
    var CharacterListViewModelObject: CharacterListViewModel!
    var mockAPIService: MockApiService!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockApiService()
        CharacterListViewModelObject = CharacterListViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        CharacterListViewModelObject = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    
    func testGetCharacterListData() {
        mockAPIService.characterResultList = [CharacterResult]()
        CharacterListViewModelObject.getCharacterListData { (_,_)  in
        }
        XCTAssert(mockAPIService!.isFetchTopStoriesCalled)
    }
    
    func testGetCharacterListFail() {
        CharacterListViewModelObject.getCharacterListData { (_,_) in
        }
        mockAPIService.fetchFail(error: nil )
    }
    
}

extension CharacterListViewModelTest {
    private func goToFetchTopStoriesFinished() {
        mockAPIService.characterResultList = StubGenerator().stubTopStories()
        CharacterListViewModelObject.getCharacterListData { (_,_) in
        }
        mockAPIService.fetchSuccess()
    }
}


class MockApiService: APIServiceProtocol {
    
    var isFetchTopStoriesCalled = false
    var characterResultList: [CharacterResult] = [CharacterResult]()
    var completeClosure: ((Bool, [CharacterResult], Error?) -> ())!
    
    func fetchCharacterList(completion: @escaping (Bool, [CharacterResult]?, Error?) -> ()) {
        isFetchTopStoriesCalled = true
        completeClosure = completion
    }
    
    func fetchCharacterDetails(request: CharacterDetailsModel, completion: @escaping (Bool, [CharacterResult]?, Error?) -> ()) {
        isFetchTopStoriesCalled = true
        completeClosure = completion
    }
    
    func fetchSuccess() {
        completeClosure( true, characterResultList, nil )
    }
    
    func fetchFail(error: Error?) {
        completeClosure( false, characterResultList, error )
    }
}


class StubGenerator {
    func stubTopStories() -> [CharacterResult] {
        let path = Bundle.main.path(forResource: "content", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let topStoriesList = try! decoder.decode(CharacterResponse.self, from: data)
        return topStoriesList.data!.results
    }
}
