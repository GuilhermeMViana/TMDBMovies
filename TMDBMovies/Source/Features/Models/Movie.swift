//
//  Movie.swift
//  TMDBMovies
//
//  Created by Guilherme Muniz Viana on 19/08/25.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var title: String
    var description: String
    var releaseDate: String
    var posterPath: String?
    var userRating: Double
}
