//
//  TableViewCell.swift
//  MovieAppTutorial
//
//  Created by Muhammad Rajab Priharsanto on 25/03/21.
//

import UIKit

class TableViewCell: UITableViewCell
{
    let moviePoster: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode  = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let movieTitle: UILabel = {
        let updatedLabel = UILabel()
        updatedLabel.numberOfLines = 2
        updatedLabel.font = UIFont(name: "Ubuntu", size: 12)
        return updatedLabel
    }()
    
    let movieReleaseDate = UILabel()
    
    let movieSummary: UILabel = {
        let updatedLabel = UILabel()
        updatedLabel.numberOfLines = 5
        return updatedLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(moviePoster)
        addSubview(movieTitle)
        addSubview(movieReleaseDate)
        addSubview(movieSummary)
        
        moviePoster.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        
        movieTitle.anchor(top: topAnchor, left: moviePoster.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 50, paddingBottom: 5, paddingRight: 0, width: frame.size.width / 1.6, height: 0, enableInsets: false)
        
        movieReleaseDate.anchor(top: movieTitle.bottomAnchor, left: moviePoster.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        movieSummary.anchor(top: movieReleaseDate.bottomAnchor, left: moviePoster.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 50, paddingBottom: 5, paddingRight: 0, width: frame.size.width / 1.6, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
