//
//  ViewController.swift
//  TMDBMovies
//
//  Created by Guilherme Muniz Viana on 18/08/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let movies: [Movie] = [
        Movie(id: 1, title: "Órfã 2: A Origem", description: "", releaseDate: "2022-07-27", posterPath: nil, userRating: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", description: "", releaseDate: "2022-06-29", posterPath: nil, userRating: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", description: "", releaseDate: "2022-07-06", posterPath: nil, userRating: 6.8),
        Movie(id: 4, title: "Avatar", description: "", releaseDate: "2009-12-18", posterPath: nil, userRating: 8.8),
    ]

    @IBOutlet weak var moviesTable: UITableView!
    
    override func viewDidLoad() {
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
        cell.ivMovie.image = UIImage(named: movie.posterPath ?? "")
        return cell
    }


}

