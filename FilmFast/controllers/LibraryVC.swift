//
//  ViewController.swift
//  FilmFast
//
//  Created by MAC on 12/12/2020.
//

import UIKit

enum LibrarySections:Int {
    case MoviesToSee, MoviesSeen
}

class LibraryVC: UIViewController {
    
    let titleLabel = UILabel()
    let libraryTableView = UITableView()
    var movieManager: MovieManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configureUI()
        // Do any additional setup after loading the view.
    }
    private func configureUI(){
        configureTitleLabel()
        configureFilmsTableView()
        
    }
    private func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.text = "Film Fast"
        titleLabel.textColor = .white
        let fontDescreptor = UIFontDescriptor(name: "Cochin", size: 37).withSymbolicTraits(UIFontDescriptor.SymbolicTraits([.traitItalic, .traitBold]))
        titleLabel.font = UIFont(descriptor: fontDescreptor!, size: 37)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 36),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func configureFilmsTableView(){
        view.addSubview(libraryTableView)
        libraryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
        
        libraryTableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        NSLayoutConstraint.activate([
            libraryTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            libraryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            libraryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            libraryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
        
    }
}

extension LibraryVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else {return 0}
        guard let librarySection = LibrarySections(rawValue:section) else {fatalError()}
        switch librarySection {
        case .MoviesSeen:
            return movieManager.moviesSeen
        case .MoviesToSee:
            return movieManager.moviesToSee
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager = movieManager, let librarySection = LibrarySections(rawValue:indexPath.section) else {fatalError()}
        let cell = tableView.dequeueReusableCell(withIdentifier:  "MovieCell", for: indexPath) as! MovieCell
        
        switch librarySection {
        case .MoviesSeen:
            cell.setupMovieData(movie: movieManager.checkedOffMovieAt(index: indexPath.row))
        case .MoviesToSee:
            cell.setupMovieData(movie: movieManager.movieAtIndex(index: indexPath.row))
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager, let librarySection = LibrarySections(rawValue:indexPath.section) else {fatalError()}
        if librarySection == .MoviesToSee {
            movieManager.checkOffMovieAt(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

