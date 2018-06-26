//
//  Movie.swift
//  ImdbTask
//
//  Created by Mohamed Hussien on 25/06/2018.
//  Copyright © 2018 Mohamed Hussien. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieResponse: Mappable {

    var Name: String?
    var PosterUrl: String?
    var Year: String?
    var imdbID: String?
    var responseType: String?
    
    init?(map: Map) {
        Name <- map["Title"]
        PosterUrl <- map["Poster"]
        Year <- map["Year"]
        imdbID <- map["imdbID"]
        responseType <- map["Type"]
    }
    
    mutating func mapping(map: Map) {
        Name <- map["Title"]
        PosterUrl <- map["Poster"]
        Year <- map["Year"]
        imdbID <- map["imdbID"]
        responseType <- map["Type"]
    }
    
}


