//
//  MovieDBTests.swift
//  MovieDBTests
//
//  Created by kaidong pei on 12/3/17.
//  Copyright © 2017 kaidong pei. All rights reserved.
//

import XCTest

@testable import MovieDB

class MovieDBTests: XCTestCase {
    
    var testVC: ViewController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPICall()
    {
       
        
        var testExpectation = XCTestExpectation()
        testExpectation = expectation(description: "Api error")
        
        let myUrlStr = "https://api.themoviedb.org/3/search/movie?api_key=b5f7420f86c236da58cd9bf8b3ca8ae5&language=en-US&query=superman&page=1&include_adult=false"
        let myUrl = URL(string: myUrlStr)
        
        let dataTask = URLSession.shared.dataTask(with: myUrl!) { (data, response, error) in
            // ASSERTION STATEMENTS
            XCTAssertNil(error, "Error while contacting the API")
            
            // URLResponse -> StatusCode
            let httpResponse = response as? HTTPURLResponse
            let status = httpResponse?.statusCode
            XCTAssertEqual(status, 200, "HTTP Response Status Code: \(status!)")
            
            // Test something from Data also
            
            
            testExpectation.fulfill()
            
        }
        
        dataTask.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    
    
}
