//
//  ViewController.swift
//  LuckyApp
//
//  Created by Camila Perez Tellado on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        renderViews()
    }
}

// MARK: UI
private extension HomeViewController {
    func renderViews() {
        setupNavBar()
        setupTableView()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .lightGray
        title = "Lucky"
    }
    
    func setupTableView() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(OfferSectionTableViewCell.self, forCellReuseIdentifier: OfferSectionTableViewCell.cellIdentifier)
        tableView.register(OfferTableViewCell.self, forCellReuseIdentifier: OfferTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: UITableViewDelegate & UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


