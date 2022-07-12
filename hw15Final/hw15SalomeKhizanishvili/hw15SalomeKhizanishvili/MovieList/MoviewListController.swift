//
//  ViewController.swift
//  hw15SalomeKhizanishvili
//
//  Created by salo khizanishvili on 11.07.22.
//

import UIKit

class MovieListController: UIViewController {
    
    
    @IBOutlet weak var movieListTable: UITableView!
    var movieListModel : MovieListModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListModel = MovieListModel(movies: MockData.movieArray)
        
        movieListTable.dataSource = self
        movieListTable.delegate = self
        movieListTable.sectionHeaderTopPadding = 0

        movieListTable.register(UINib(nibName: "MovieCell", bundle: nil),
                                   forCellReuseIdentifier: "MovieCell")
    }
    
}


extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListModel.moviewCount(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieListModel.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieCell = movieListTable.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        movieCell.configure(movie: movieListModel.getMovie(in: indexPath.section,
                                                           at: indexPath.row))
        movieCell.delegate = self
        if indexPath.section == 0 {
            movieCell.addToWatch.isHidden = true
        } else {
            movieCell.addToWatch.isHidden = false
        }
    
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        if let detail =  detailViewController as? DetailViewController {
            detail.movie = movieListModel.getMovie(in: indexPath.section,
                                                   at: indexPath.row)
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movieListModel.sectionName(for: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
}

extension MovieListController: MovieCellDelegate {
    
    func movieCellWatchedClicked(_ movie: Movie) {
        let oldIndexPath = movieListModel.getMovieIndexPath(movie)
        movieListModel.removeMovie(in: oldIndexPath.section, at: oldIndexPath.row)
        movieListModel.addMovie(in: 0, movie)
        movieListTable.reloadData()
    }
}
