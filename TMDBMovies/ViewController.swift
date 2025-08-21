//
//  ViewController.swift
//  TMDBMovies
//
//  Created by Guilherme Muniz Viana on 18/08/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movie] = []
    let api = Network()

    @IBOutlet weak var moviesTable: UITableView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        moviesTable.dataSource = self
        moviesTable.delegate = self
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        //Input colors in type gradient var
        gradient.colors = [Colors.initialGradient.cgColor, Colors.finalGradient.cgColor]
        // Where the gradient efect will start
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        // Where the gradient will stop
        gradient.endPoint = CGPoint(x: 0.0, y: 0.75)
        // Upgrade gradient to mach with view bounds
        gradient.frame = view.bounds
        // Insert gradient in screen
        view.layer.insertSublayer(gradient, at: 0)
        
        Task {
            do {
                let fetchedMovies = try await api.fetchPopularMovies()
                
                DispatchQueue.main.async {
                    self.movies = fetchedMovies
                    self.moviesTable.reloadData()
                    print("Filmes")
                }
            } catch {print(error.localizedDescription)}
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        
        let formattedDate = movie.releaseDate.replacingOccurrences(of: "-", with: "/")
        
        cell.lbTitle?.text = movie.title
        cell.lbReleaseDate?.text = "Lançamento: \(formattedDate)"
        
        if let posterPath = movie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/original\(posterPath)") {
            // call method from extension
            cell.ivMovie.load(url: url)
        }
        return cell
    }


}

