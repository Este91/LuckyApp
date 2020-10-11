//
//  OfferTableViewCell.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

final class OfferTableViewCell: UITableViewCell {

    static let cellIdentifier = "OfferTableViewCell"
    private let offerImageView = UIImageView()
    private let brandLabel = UILabel()
    private let titleLabel = UILabel()
    private let tagsLabel = UILabel()
    private let favouritesLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellStyle()
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        clearImage()
        clearLabels()
    }
}

// MARK: Setup cell
extension OfferTableViewCell {
//    func setupCell(data: OffersData) {
    func setupCell(data: Item?) {
        brandLabel.text = data?.brand.uppercased()
        titleLabel.text = data?.title
        tagsLabel.text = data?.tags
        favouritesLabel.text = getFavoriteString(data?.favoriteCount)
    }
}

// MARK: Privates
private extension OfferTableViewCell {
    func setupCellStyle() {
        backgroundColor = .white
        selectionStyle = .default
    }

    func setupViews() {
        setupImageView()
        setupBrandLabel()
        setupTitleLabel()
        setupTagsLabel()
        setupFavouritesLabel()
    }

    func setupImageView() {
        offerImageView.translatesAutoresizingMaskIntoConstraints = false
        offerImageView.contentMode = .scaleAspectFit
        offerImageView.backgroundColor = .red
        offerImageView.layer.cornerRadius = 2
        contentView.addSubview(offerImageView)
        NSLayoutConstraint.activate([
            offerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            offerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            offerImageView.heightAnchor.constraint(equalToConstant: 80),
            offerImageView.widthAnchor.constraint(equalToConstant: 120),
            offerImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    func setupBrandLabel() {
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.textAlignment = .left
        brandLabel.numberOfLines = 1
        brandLabel.font = UIFont.systemFont(ofSize: 10)
//        brandLabel.textColor = .darkGray fixxxxxxxxxxxxxx
        contentView.addSubview(brandLabel)
        NSLayoutConstraint.activate([
            brandLabel.leftAnchor.constraint(equalTo: offerImageView.rightAnchor, constant: 16),
            brandLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            brandLabel.topAnchor.constraint(equalTo: offerImageView.topAnchor)
        ])
    }

    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: offerImageView.rightAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            titleLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 6)
        ])
    }

    func setupTagsLabel() {
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false
        tagsLabel.textAlignment = .left
        tagsLabel.numberOfLines = 1
        tagsLabel.font = UIFont.systemFont(ofSize: 10)
        tagsLabel.textColor = .darkGray
        contentView.addSubview(tagsLabel)
        NSLayoutConstraint.activate([
            tagsLabel.leftAnchor.constraint(equalTo: offerImageView.rightAnchor, constant: 16),
            tagsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            tagsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            tagsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    func setupFavouritesLabel() {
        let heart = "♡ 1,5K"
        favouritesLabel.translatesAutoresizingMaskIntoConstraints = false
        favouritesLabel.text = heart
        favouritesLabel.textAlignment = .left
        favouritesLabel.numberOfLines = 1
        favouritesLabel.font = UIFont.systemFont(ofSize: 12)
        favouritesLabel.textColor = .darkGray
        contentView.addSubview(favouritesLabel)
        NSLayoutConstraint.activate([
            favouritesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            favouritesLabel.topAnchor.constraint(equalTo: brandLabel.topAnchor)
        ])
    }

    func getFavoriteString(_ favoriteCount: Int?) -> String {
        guard let favoriteCount = favoriteCount else { return "" }
        var favoriteString = "♡ "
        let unidadDeMil = String(favoriteCount / 1000)
        let centenas = String((favoriteCount % 1000) / 100)

        if unidadDeMil == "0" {
            return favoriteString + String(favoriteCount)
        } else {
            favoriteString = centenas == "0" ? favoriteString + " " + unidadDeMil : favoriteString + " " + unidadDeMil + ", " + centenas
            return favoriteString + "K"
        }
    }

    func clearImage() {
        offerImageView.image = nil
    }

    func clearLabels() {
        brandLabel.text = ""
        titleLabel.text = ""
        tagsLabel.text = ""
        favouritesLabel.text = ""
    }
}
