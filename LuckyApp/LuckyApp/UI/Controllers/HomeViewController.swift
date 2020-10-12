//
//  ViewController.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let homeViewModel = HomeViewModel()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.getOffersData()
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
        navigationController?.navigationBar.barTintColor = "#F7F9FA".hexaToUIColor()
        title = "Home"
    }
    
    func setupTableView() {
        tableView.prepareForAutolayout()
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
        let numberOfRowsInSection = homeViewModel.getOffers()?.sections[section].items.count
        return numberOfRowsInSection != nil ? numberOfRowsInSection! + 1 : 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.getOffers()?.sections.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let sectionCell = tableView.dequeueReusableCell(withIdentifier: OfferSectionTableViewCell.cellIdentifier, for: indexPath) as? OfferSectionTableViewCell {
                    let data = dataForSectionCellAt(indexPath: indexPath)
                    sectionCell.setupCell(data: data)
                    return sectionCell
                }
        } else {
            if let rowCell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.cellIdentifier, for: indexPath) as? OfferTableViewCell {
                let data = dataForCellAt(indexPath: indexPath)
                rowCell.setupCell(data: data)
                return rowCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            let detailUrl = homeViewModel.getOffers()?.sections[indexPath.section].items[indexPath.row - 1].detailUrl
            homeViewModel.getOfferDetailData(offerDetailUrl: detailUrl ?? "")
        }
    }
}

extension HomeViewController {
    func dataForCellAt(indexPath: IndexPath) -> Item? {
        return homeViewModel.getOffers()?.sections[indexPath.section].items[indexPath.row - 1]
    }

    func dataForSectionCellAt(indexPath: IndexPath) -> OffersSectionData {
        let sectionTitle = homeViewModel.getOffers()?.sections[indexPath.section].title ?? ""
        return OffersSectionData(sectionTitle: sectionTitle)
    }
}

struct OffersData {
    let title: String
    
}

struct OffersSectionData {
    let sectionTitle: String
}

// MARK: HomeViewModelDataProtocol
extension HomeViewController: HomeViewModelDataProtocol {
    func offersDataUpdated() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func offerDetailDataUpdated() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(OfferDetailViewController(), animated: true)
        }
    }
}


