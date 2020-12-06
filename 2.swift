//
//  main.swift
//  aoc2020
//
//  Created by Ville Saarinen on 6.12.2020.
//

import Foundation

func aoc2() {
    if let rows = readTextFile(path: "/Users/ville/Repos/adventofcode-2020/aoc2020/2.txt") {
        var correct = [0, 0]
        var incorrect = [0, 0]
        for row in rows {
            // Format: "<n>-<m> <char>: <password>"
            let components = row.components(separatedBy: ":").map { $0.trimmingCharacters(in: .whitespaces) }
            if components.count != 2 {
                continue
            }
            let rule = components[0]
            let password = components[1]
            let ruleParts = rule.components(separatedBy: " ")
            let counts = ruleParts[0].components(separatedBy: "-").compactMap { Int($0) }
            let character = ruleParts[1].first
            
            // Part 1
            let count = password.filter({ $0 == character }).count
            if count >= counts[0] && count <= counts[1] {
                correct[0] += 1
            } else {
                incorrect[0] += 1
            }
            
            // Part 2
            let inPlaceCharacters = counts.map(
                { password[password.index(password.startIndex, offsetBy: $0-1)] == character ? 1 : 0 }
            ).reduce(0, +)
            if inPlaceCharacters == 1 {
                correct[1] += 1
            } else {
                incorrect[1] += 1
            }
        }
        print("Part 1: correct: \(correct[0]), incorrect: \(incorrect[0])")
        print("Part 2: correct: \(correct[1]), incorrect: \(incorrect[1])")
    }
}
