//
//  Network.swift
//  TMDBMovies
//
//  Created by Guilherme Muniz Viana on 21/08/25.
//

import Foundation

class Network {
    var movies: [Movie] = []
    
    // Var to instance apiKey from enviroment variables
    private var apiKey: String {
        guard let key = ProcessInfo.processInfo.environment["TMDB_API_KEY"] else {
            fatalError("API KEY not found")
        }
        return key
    }
    
    func fetchPopularMovies() async throws -> [Movie] {
        // API Url
        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/week")!
        // Turn URL into a object to simplify query
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        // Define language from request
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        // final urlRequest with language parameter
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        
        // accept: define expected response type and access to api token
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(apiKey)"
        ]

        // async request for tuple (data, http)
        let (data, _) = try await URLSession.shared.data(for: request)
        // print api response
        print(String(decoding: data, as: UTF8.self))
        
        do {
            let decorder = JSONDecoder()
            let movieResponse = try decorder.decode(MovieResponse.self, from: data)
            
            self.movies = movieResponse.results
            
            return self.movies
        } catch {print(error.localizedDescription)}
        
        return movies
    }
}
