//
//  ViewController.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeViewModel = HomeViewModel()
    private let tableView = UITableView()
    let loadingVC = LoadingViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.getOffersData()
        renderViews()
        addLoadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Home"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
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
        let numberOfItemsInSection = homeViewModel.getNumberOfItemsInSection(section)
        return numberOfItemsInSection != nil ? numberOfItemsInSection! + 1 : 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.getNumberOfSections()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let sectionCell = tableView.dequeueReusableCell(withIdentifier: OfferSectionTableViewCell.cellIdentifier, for: indexPath) as? OfferSectionTableViewCell {
                let sectionTitle = homeViewModel.dataForSectionCellAt(indexPath: indexPath)
                sectionCell.setupCell(sectionTitle)
                return sectionCell
                }
        } else {
            if let rowCell = tableView.dequeueReusableCell(withIdentifier: OfferTableViewCell.cellIdentifier, for: indexPath) as? OfferTableViewCell {
                let data = homeViewModel.dataForCellAt(indexPath: indexPath)
                rowCell.setupCell(data)
                return rowCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row > 0 {
            addLoadingView()
            let detailUrl = homeViewModel.getDetailUrl(indexPath)
            homeViewModel.getOfferDetailData(detailUrl)
        }
    }
}

// MARK: HomeViewModelDataProtocol
extension HomeViewController: HomeViewModelDataProtocol {
    func offersDataUpdated() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.removeLoadingView()
            self.tableView.reloadData()
        }
    }
    
    func offerDetailDataUpdated() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let viewModel = self.homeViewModel.getDetailViewModel() {
                let offerDetailVC = OfferDetailViewController(detailViewModel: viewModel)
                self.navigationController?.pushViewController(offerDetailVC, animated: true)
                self.removeLoadingView()
            }
        }
    }
}

// MARK: LoadingView
private extension HomeViewController {
    func addLoadingView() {
        addChild(loadingVC)
        loadingVC.view.frame = view.frame
        view.addSubview(loadingVC.view)
        loadingVC.didMove(toParent: self)
    }
    
    func removeLoadingView() {
        loadingVC.willMove(toParent: nil)
        loadingVC.view.removeFromSuperview()
        loadingVC.removeFromParent()
    }
}


