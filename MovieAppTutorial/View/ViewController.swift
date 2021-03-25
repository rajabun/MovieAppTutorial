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
    let segmentedControl: UISegmentedControl = {
        let items = MovieViewModel().segmentedItems
        let segmentedControl = UISegmentedControl(items: items)
        return segmentedControl
    }()
    
    override func loadView() {
        super.loadView()
        setupTableView()
        setupSegmentedControl()
        settingConstraint()
        setupStackView()
        fetchData()
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
                            
                    self?.tableView.delegate = self
                    self?.tableView.dataSource = self
                    self?.tableView.reloadData()
                }
            }
        }
    }

    func settingConstraint() {
        let frame = UIScreen.main.bounds
        
        segmentedControl.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width - 20, height: frame.height*0.05, enableInsets: false)
        
        tableView.anchor(top: segmentedControl.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height, enableInsets: false)
    }
    
    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [segmentedControl, tableView])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 5
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: view.frame.width, height: view.frame.height, enableInsets: false)
    }
    
    func setupTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "MoviesCell")
        view.addSubview(tableView)
    }

    func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex =  0
        
        let frame = UIScreen.main.bounds
        segmentedControl.frame = CGRect(x: frame.minX + 10, y: frame.minY + 50, width: frame.width - 20, height: frame.height*0.05)
        
        segmentedControl.layer.cornerRadius = 5.0
        
        segmentedControl.addTarget(self, action: #selector(self.switchMovieList(_:)), for: .valueChanged)
        self.view.addSubview(segmentedControl)
    }
    
    @objc func switchMovieList(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
        case 0:
            viewModel.request.resourceURL = URL(string: viewModel.request.resourceStringPopular) ?? URL(string: "")!
        case 1:
            viewModel.request.resourceURL = URL(string: viewModel.request.resourceStringUpcoming) ?? URL(string: "")!
        case 2:
            viewModel.request.resourceURL = URL(string: viewModel.request.resourceStringTopRated) ?? URL(string: "")!
        case 3:
            viewModel.request.resourceURL = URL(string: viewModel.request.resourceStringNowPlaying) ?? URL(string: "")!
        default:
            break
        }
        fetchData()
        tableView.reloadData()
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height*0.25
    }
}

