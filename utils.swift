//
//  utils.swift
//  aoc2020
//
//  Created by Ville Saarinen on 6.12.2020.
//

import Foundation

func readTextFile(path: String) -> [String]? {
    do {
        let contents = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        return contents.components(separatedBy: "\n")
    } catch let error as NSError {
        print("Unable to open file: \(error)")
        return nil
    }
}
