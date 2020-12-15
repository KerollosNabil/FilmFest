//
//  MovieCellTableViewCell.swift
//  FilmFast
//
//  Created by MAC on 15/12/2020.
//

import UIKit

class MovieCell: UITableViewCell {

    var movieData:Movie?{
        didSet{
            self.textLabel?.text = movieData?.title
            self.detailTextLabel?.text = movieData?.releaseDate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupMovieData(movie:Movie?){
        movieData = movie
    }

}
