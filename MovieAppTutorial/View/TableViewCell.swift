//
//  TableViewCell.swift
//  MovieAppTutorial
//
//  Created by Muhammad Rajab Priharsanto on 25/03/21.
//

import UIKit

class TableViewCell: UITableViewCell
{
    let viewController = ViewController()
    
    let moviePoster: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode  = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let movieTitle = UILabel()
    let movieReleaseDate = UILabel()
    let movieSummary = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(moviePoster)
        addSubview(movieTitle)
        addSubview(movieReleaseDate)
        addSubview(movieSummary)
        
        moviePoster.topAnchor.constraint(equalTo: viewController.tableView.topAnchor).isActive = true
        moviePoster.bottomAnchor.constraint(equalTo: viewController.tableView.bottomAnchor).isActive = true
        moviePoster.leftAnchor.constraint(equalTo: viewController.tableView.leftAnchor).isActive = true
        moviePoster.rightAnchor.constraint(equalTo: viewController.tableView.rightAnchor).isActive = true
        
        movieTitle.topAnchor.constraint(equalTo: viewController.tableView.topAnchor).isActive = true
        movieTitle.bottomAnchor.constraint(equalTo: movieReleaseDate.bottomAnchor).isActive = true
        movieTitle.leftAnchor.constraint(equalTo: moviePoster.leftAnchor).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: viewController.tableView.rightAnchor).isActive = true
        
        movieReleaseDate.topAnchor.constraint(equalTo: movieTitle.topAnchor).isActive = true
        movieReleaseDate.bottomAnchor.constraint(equalTo: movieSummary.bottomAnchor).isActive = true
        movieReleaseDate.leftAnchor.constraint(equalTo: moviePoster.leftAnchor).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: viewController.tableView.rightAnchor).isActive = true
        
        movieSummary.topAnchor.constraint(equalTo: movieReleaseDate.topAnchor).isActive = true
        movieSummary.bottomAnchor.constraint(equalTo: viewController.tableView.bottomAnchor).isActive = true
        movieSummary.leftAnchor.constraint(equalTo: moviePoster.leftAnchor).isActive = true
        movieSummary.rightAnchor.constraint(equalTo: viewController.tableView.rightAnchor).isActive = true
        
//        moviePoster.topAnchor
//        moviePoster.translatesAutoresizingMaskIntoConstraints = true
//        moviePoster.center = CGPoint(x: moviePoster.bounds.midX, y: moviePoster.bounds.midY)
//        moviePoster.autoresizingMask = [UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
