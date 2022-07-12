//
//  MovieCell.swift
//  hw15SalomeKhizanishvili
//
//  Created by salo khizanishvili on 11.07.22.
//

import UIKit


protocol MovieCellDelegate {
    func movieCellWatchedClicked(_ movie: Movie)
}


class MovieCell: UITableViewCell {

    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var addToWatch: UIButton!
    
    var delegate: MovieCellDelegate!
    
    var movie: Movie!
    
    func configure(movie: Movie){
        self.movie = movie
        rating.text = String(movie.imdb)
        title.text = movie.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addToWatchedClicked(){
        delegate.movieCellWatchedClicked(movie)
    }
    
}
