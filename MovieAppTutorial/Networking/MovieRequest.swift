//
//  MovieRequest.swift
//  MovieAppTutorial
//
//  Created by Muhammad Rajab Priharsanto on 25/03/21.
//

import Foundation

enum MovieError:Error
{
    case noDataAvailable
    case canNotProcessData
}

class MovieRequest
{
    var resourceURL: URL
    let resourceStringPopular = "https://api.themoviedb.org/3/movie/popular?api_key=1d7d9a8ddce6212c0d9ab76119aa9893&language=en-US&page=1"
    let resourceStringUpcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=1d7d9a8ddce6212c0d9ab76119aa9893&language=en-US&page=1"
    let resourceStringTopRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=1d7d9a8ddce6212c0d9ab76119aa9893&language=en-US&page=1"
    let resourceStringNowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=1d7d9a8ddce6212c0d9ab76119aa9893&language=en-US&page=1"
    
    init()
    {
        guard let resourceURL = URL(string: resourceStringPopular)
        else
        {
            fatalError()
        }
        self.resourceURL = resourceURL
        print("init berhasil")
    }
}
