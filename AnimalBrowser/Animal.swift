//
//  Animal.swift
//  AnimalBrowser
//
//  Created by Oliver Foggin on 12/06/2015.
//  Copyright © 2015 Oliver Foggin. All rights reserved.
//

import Foundation

final class AnimalDataSource {
    var animals: [Animal] = {
        guard let path = NSBundle.mainBundle().pathForResource("Animals", ofType: "plist"),
            animalArray = NSArray(contentsOfFile: path) as? [[String: String]] else {return []}

        let array = animalArray.map {
            a in
            return Animal(name: a["name"]!,
                latinName: a["species"]!,
                text: a["text"]!,
                imageName: a["photo"],
                authorName: a["authorName"]!,
                authorPhotoName: a["authorPhoto"]!)
        }.sort{$0 < $1}
        
        print(array)
        
        return array
    }()
}

struct Animal : CustomDebugStringConvertible {
    let name: String
    let latinName: String
    let text: String
    let imageName: String? // some animals don't have photos
    let authorName: String
    let authorPhotoName: String
    
    var debugDescription: String {
        get {
            return "\(name) - \(latinName)"
        }
    }
}

extension Animal: Comparable {}

func ==(lhs: Animal, rhs: Animal) -> Bool {
    return lhs.name == rhs.name
}

func <=(lhs: Animal, rhs: Animal) -> Bool {
    return lhs.name <= rhs.name
}

func <(lhs: Animal, rhs: Animal) -> Bool {
    return lhs.name < rhs.name
}

func >=(lhs: Animal, rhs: Animal) -> Bool {
    return lhs.name >= rhs.name
}