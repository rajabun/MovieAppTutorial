//
//  ViewController.swift
//  MovieAppTutorial
//
//  Created by Muhammad Rajab Priharsanto on 25/03/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
        // Do any additional setup after loading the view.
    }

    func fetchData()
    {
        viewModel.getData
        { [weak self] result in
            switch result
            {
            case .failure(let error):
                print(error)
            case .success(let movies):
                DispatchQueue.main.async
                {
                    self?.viewModel.listOfMovies = movies
                    print("Total Movie List =", self?.viewModel.listOfMovies.count ?? 0)
                    //print("Movie List =", self!.listOfMovies)
                            
                    self?.tableView.delegate = self
                    self?.tableView.dataSource = self
                    self?.tableView.reloadData()
                }
            }
        }
    }

    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MoviesCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Table View Rows =", viewModel.listOfMovies.count)
        return viewModel.listOfMovies.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as? TableViewCell
        
        let movie = viewModel.listOfMovies[indexPath.row]
        
        let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        
        cell?.moviePoster.sd_setImage(with: urlImage, completed: nil)
        cell?.movieTitle.text = movie.title
        cell?.movieReleaseDate.text = movie.release_date
        cell?.movieSummary.text = movie.overview
        
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let movie = viewModel.listOfMovies[indexPath.row]
        let urlImage = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        
        UserDefaults.standard.set(movie.title, forKey: "MovieDetailTitle")
        UserDefaults.standard.set(movie.release_date, forKey: "MovieDetailReleaseDate")
        UserDefaults.standard.set(movie.overview, forKey: "MovieDetailOverview")
        UserDefaults.standard.set(urlImage, forKey: "MovieDetailPosterUrl")
        //UserDefaults.standard.set(false, forKey: "MovieFavoriteAction")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
}

