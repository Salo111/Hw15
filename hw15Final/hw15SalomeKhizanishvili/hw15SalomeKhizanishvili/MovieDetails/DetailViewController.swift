//
//  DetailViewController.swift
//  hw15SalomeKhizanishvili
//
//  Created by salo khizanishvili on 11.07.22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
 
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var mainActor: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        movieTitle.text = movie.title
        releaseDate.text = movie.releaseDate
        imdb.text = String(movie.imdb)
        mainActor.text = movie.mainActor
        movieDescription.text = movie.description
    }

}
