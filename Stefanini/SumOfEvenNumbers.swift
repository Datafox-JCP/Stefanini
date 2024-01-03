//
//  SumOfEvenNumbers.swift
//  Stefanini
//
//  Created by Juan Hernandez Pazos on 03/01/24.
//

import Foundation

func sumOfEvenNumbers(_ numbers: [Int]) -> Int {
    let evenNumbers = numbers.filter { $0 % 2 == 0 }
    return evenNumbers.reduce(0, +)
}

/*
 var sum = 0
 for number in numbers {
     if number % 2 == 0 {
         sum += number
     }
 }
 return sum
 */
