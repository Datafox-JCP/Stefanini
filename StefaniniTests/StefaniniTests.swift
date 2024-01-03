//
//  StefaniniTests.swift
//  StefaniniTests
//
//  Created by Juan Hernandez Pazos on 03/01/24.
//

import XCTest
@testable import Stefanini

final class StefaniniTests: XCTestCase {

    func testSumOfEvenNumbers() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let expectedResult = 2 + 4 + 6 + 8 // 20

        let result = sumOfEvenNumbers(numbers)

        XCTAssertEqual(result, expectedResult, "Something is wrong")
    }

    func testSecondSumOfEvenNumbers() {
        let numbers = [110, 222, 9, 55, 64, 72, 908, 1, 10033]

        let result = sumOfEvenNumbers(numbers)

        XCTAssertEqual(result, 1376, "Something is wrong")
    }
    
}
