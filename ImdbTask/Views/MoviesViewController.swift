//
//  ViewController.swift
//  ImdbTask
//
//  Created by Mohamed Hussien on 25/06/2018.
//  Copyright © 2018 Mohamed Hussien. All rights reserved.
//

import UIKit
import Kingfisher
import Bond

class MoviesViewController: UIViewController {

    @IBOutlet weak var MoviesTableView: UITableView!
    @IBOutlet weak var MoviesSearchTxt: UITextField!
    
    var dataSource: [MovieResponse] = []
    var moviesViewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = MoviesSearchTxt.reactive.text.observeNext { (text) in
            self.moviesViewModel.search.value = text ?? ""
            self.moviesViewModel.getMovies().observe(with: { (event) in
                guard let movies = event.element else{return}
                self.dataSource = movies
                self.MoviesTableView.reloadData()
            })
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let url = URL(string:movie.PosterUrl ?? "")
        cell.movieImg.contentMode = .scaleAspectFit
        cell.movieImg.kf.setImage(with: url)
        cell.movieNameLbl.text = movie.Name
        cell.movieDesciptionLbl.text = ""
        
        return cell
    }
    
}

