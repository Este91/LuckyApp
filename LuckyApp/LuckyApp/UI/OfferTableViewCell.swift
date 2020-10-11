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
    private let favoritesView = UIView()
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
        offerImageView.setRemoteImage(imageUrl: data?.imageUrl ?? "")
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
        setupFavoritesView()
    }

    func setupImageView() {
        offerImageView.translatesAutoresizingMaskIntoConstraints = false
        offerImageView.contentMode = .scaleAspectFit
        offerImageView.clipsToBounds = true
        offerImageView.backgroundColor = .lightGray
        offerImageView.layer.cornerRadius = 2
        contentView.addSubview(offerImageView)
        NSLayoutConstraint.activate([
            offerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN),
            offerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            offerImageView.heightAnchor.constraint(equalToConstant: 80),
            offerImageView.widthAnchor.constraint(equalToConstant: 120),
            offerImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -UI.Margin.L_MARGIN)
        ])
    }

    func setupBrandLabel() {
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.textAlignment = .left
        brandLabel.numberOfLines = 1
        brandLabel.font = UIFont.systemFont(ofSize: 10) // corregir font
        brandLabel.textColor = "#718897".hexaToUIColor()
        contentView.addSubview(brandLabel)
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: offerImageView.topAnchor),
            brandLabel.leftAnchor.constraint(equalTo: offerImageView.rightAnchor, constant: UI.Margin.S_MARGIN)
        ])
    }

    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16) // corregir font
        titleLabel.textColor = "#222D34".hexaToUIColor()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.34
        titleLabel.attributedText = NSMutableAttributedString(string: "Offer", attributes: [NSAttributedString.Key.kern: 0.25, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: offerImageView.rightAnchor, constant: UI.Margin.S_MARGIN),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.XL_MARGIN),
            titleLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor)
        ])
    }

    func setupTagsLabel() {
        tagsLabel.translatesAutoresizingMaskIntoConstraints = false
        tagsLabel.textAlignment = .left
        tagsLabel.numberOfLines = 1
        tagsLabel.font = UIFont.systemFont(ofSize: 10) // corregir font
        tagsLabel.textColor = "#718897".hexaToUIColor()
        contentView.addSubview(tagsLabel)
        NSLayoutConstraint.activate([
            tagsLabel.leftAnchor.constraint(equalTo: offerImageView.rightAnchor, constant: UI.Margin.S_MARGIN),
            tagsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.M_MARGIN),
            tagsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: UI.Margin.XXXS_MARGIN + 2),
            tagsLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -UI.Margin.L_MARGIN)
        ])
    }
    
    func setupFavoritesView() {
        favoritesView.translatesAutoresizingMaskIntoConstraints = false
        favoritesView.backgroundColor = .clear
        contentView.addSubview(favoritesView)
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: brandLabel.topAnchor),
            favoritesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN),
            favoritesView.leftAnchor.constraint(equalTo: brandLabel.rightAnchor, constant: UI.Margin.XXS_MARGIN)
        ])
        
        let heartImageView = UIImageView()
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.clipsToBounds = true
        heartImageView.image = UIImage(named: "Heart")
        favoritesView.addSubview(heartImageView)
        NSLayoutConstraint.activate([
            heartImageView.topAnchor.constraint(equalTo: favoritesView.topAnchor),
            heartImageView.leadingAnchor.constraint(equalTo: favoritesView.leadingAnchor),
            heartImageView.bottomAnchor.constraint(equalTo: favoritesView.bottomAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: 10),
            heartImageView.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        setupFavouritesLabel()
        NSLayoutConstraint.activate([
            favouritesLabel.topAnchor.constraint(equalTo: favoritesView.topAnchor),
            favouritesLabel.leftAnchor.constraint(equalTo: heartImageView.rightAnchor, constant: 5),
            favouritesLabel.trailingAnchor.constraint(equalTo: favoritesView.trailingAnchor),
            favouritesLabel.bottomAnchor.constraint(equalTo: favoritesView.bottomAnchor),
        ])
    }

    func setupFavouritesLabel() {
        favouritesLabel.translatesAutoresizingMaskIntoConstraints = false
        favouritesLabel.textAlignment = .left
        favouritesLabel.numberOfLines = 1
        favouritesLabel.font = UIFont.systemFont(ofSize: 10)
        favouritesLabel.textColor = "#718897".hexaToUIColor()
        favoritesView.addSubview(favouritesLabel)
    }

    func getFavoriteString(_ favoriteCount: Int?) -> String {
        guard let favoriteCount = favoriteCount else { return "" }
        var favoriteString = ""
        let unidadDeMil = String(favoriteCount / 1000)
        let centenas = String((favoriteCount % 1000) / 100)

        if unidadDeMil == "0" {
            return favoriteString + String(favoriteCount)
        } else {
            favoriteString = centenas == "0" ? favoriteString + " " + unidadDeMil : favoriteString + " " + unidadDeMil + "," + centenas
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
