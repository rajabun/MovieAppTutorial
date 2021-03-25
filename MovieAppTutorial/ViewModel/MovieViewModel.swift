//
//  MovieViewModel.swift
//  MovieAppTutorial
//
//  Created by Muhammad Rajab Priharsanto on 25/03/21.
//

import Foundation

class MovieViewModel {
    let request = MovieRequest()
    var listOfMovies = [MovieDetail]()
    
    func getData (completion: @escaping(Result<[MovieDetail], MovieError>) -> Void)
    {
        let dataTask = URLSession.shared.dataTask(with: request.resourceURL)
        {data,_,_ in
            guard let jsonData = data
            else
            {
                completion(.failure(.noDataAvailable))
                return
            }
            //print("jsondata =", String(decoding: jsonData, as: UTF8.self))
            do
            {
                let decoder = JSONDecoder()
                //print("decoder berhasil")
                let movieResponse = try decoder.decode(MovieResponse.self, from: jsonData)
                //print("movieResponse berhasil")
                DispatchQueue.main.async
                {
                    let movieDetails = movieResponse.results
                    //print("movieDetails berhasil")
                    completion(.success(movieDetails))
                    print("completion berhasil")
                }
                
            }
            catch
            {
                completion(.failure(.canNotProcessData))
                print(error)
            }
        }
        dataTask.resume()
       print("getdata berhasil")
    }
}
