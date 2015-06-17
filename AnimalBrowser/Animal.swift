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
            animalArray = NSArray(contentsOfFile: path) else {return []}
        
        var array = [Animal]()
        
        for a in animalArray {
            guard let name = a["name"] as? String,
                latinName = a["species"] as? String,
                text = a["text"] as? String,
                authorName = a["authorName"] as? String,
                authorPhotoName = a["authorPhoto"] as? String else {continue}
            
            let imageName = a["photo"] as? String
            
            array.append(Animal(name: name,
                latinName: latinName,
                text: text,
                imageName: imageName,
                authorName: authorName,
                authorPhotoName: authorPhotoName))
        }
        
        return array.sort{$0 < $1}
        }()
}

struct Animal {
    let name: String
    let latinName: String
    let text: String
    let imageName: String? // some animals don't have photos
    let authorName: String
    let authorPhotoName: String
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