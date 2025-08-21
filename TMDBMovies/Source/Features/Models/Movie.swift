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
    // translate api keys into struct Movie
    enum CodingKeys: String, CodingKey {
            case id
            case title
            case description = "overview"
            case releaseDate = "release_date"
            case posterPath = "poster_path"
            case userRating = "vote_average"
        }
}
// Api returns necessary data inside a results key
// Struct to decode data from results
struct MovieResponse: Decodable {
    let results: [Movie]
}
