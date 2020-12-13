//
//  ViewController.swift
//  FilmFast
//
//  Created by MAC on 12/12/2020.
//

import UIKit


class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let filmsTableView = UITableView()

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
        view.addSubview(filmsTableView)
        filmsTableView.translatesAutoresizingMaskIntoConstraints = false
        filmsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        NSLayoutConstraint.activate([
            filmsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36),
            filmsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filmsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            filmsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
        
    }


}

