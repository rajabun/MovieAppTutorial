//
//  MovieModel.swift
//  MovieAppTutorial
//
//  Created by Muhammad Rajab Priharsanto on 25/03/21.
//

import Foundation

struct MovieDetail: Decodable
{
    let id: Int
    let poster_path: String
    let title: String
    let release_date: String
    let overview: String
}

struct MovieResponse:Decodable
{
    var results: [MovieDetail]
}
