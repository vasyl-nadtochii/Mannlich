//
//  DataManagerTests.swift
//  MannlichTests
//
//  Created by Vasyl Nadtochii on 17.01.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import XCTest
@testable import Mannlich

class DataManagerTests: XCTestCase {
    
    var dataManager: MockDataManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        dataManager = MockDataManager()
    }

    override func tearDownWithError() throws {
        dataManager = nil
        
        try super.tearDownWithError()
    }

    func testMD5Convertation() throws {
        let expectedPassword = "c77131e3b313d3a70c3d3315541501a2"
        
        XCTAssertEqual(dataManager.getPassword(), expectedPassword)
    }

}
