//
//  OfferDetailViewController.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

final class OfferDetailViewController: UIViewController {
    
    let detailViewModel: DetailViewModel
    
    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
        renderScrollView()
    }
}

// MARK: UI
private extension OfferDetailViewController {
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.tintColor = "#222D34".hexaToUIColor()
        let favoriteItem = UIBarButtonItem(image: UIImage(named: "WhiteHeart"), style: .plain, target: self, action: #selector(favoriteItemPressed))
        favoriteItem.tintColor = "#222D34".hexaToUIColor()
            
        let shareItem = UIBarButtonItem(image: UIImage(named: "Share"), style: .plain, target: self, action: #selector(shareItemPressed))
        shareItem.tintColor = "#222D34".hexaToUIColor()
            
        navigationItem.rightBarButtonItems = [favoriteItem, shareItem]
    }
    
    @objc func shareItemPressed() {
        print("Share item pressed")
    }
    
    @objc func favoriteItemPressed() {
        print("Favorite item pressed")
    }
    
    func renderScrollView() {
        let scrollView = buildScrollView()
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let contentView = buildContentView()
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let imageView = UIImageView()
        imageView.prepareForAutolayout(.lightGray)
        imageView.setRemoteImage(imageUrl: detailViewModel.imageUrl)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 251)
        ])
        
        let brandLabel = buildLabel(text: detailViewModel.brand.uppercased(), textColor: "#718897".hexaToUIColor(), font: UIFont(name: "SFProText-Medium", size: UI.FontSize.XXS_MARGIN), numberOfLines: 1)
        contentView.addSubview(brandLabel)
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: UI.Margin.XL_MARGIN),
            brandLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN)
        ])
        
        let favoritesView = UIView()
        favoritesView.prepareForAutolayout(.clear)
        contentView.addSubview(favoritesView)
        NSLayoutConstraint.activate([
            favoritesView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: UI.Margin.XL_MARGIN),
            favoritesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN),
        ])
        
        let heartImageView = UIImageView()
        heartImageView.prepareForAutolayout(.clear)
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

        let favouritesLabel = buildLabel(text: detailViewModel.favoriteCount.intToFavoriteString(), textColor: "#718897".hexaToUIColor(), font: UIFont(name: "SFProText-Medium", size: UI.FontSize.XXS_MARGIN), numberOfLines: 1)
        favoritesView.addSubview(favouritesLabel)
        NSLayoutConstraint.activate([
            favouritesLabel.topAnchor.constraint(equalTo: favoritesView.topAnchor),
            favouritesLabel.leftAnchor.constraint(equalTo: heartImageView.rightAnchor, constant: 5),
            favouritesLabel.trailingAnchor.constraint(equalTo: favoritesView.trailingAnchor),
            favouritesLabel.bottomAnchor.constraint(equalTo: favoritesView.bottomAnchor),
        ])
        
        let titleLabel = buildLabel(text: detailViewModel.title, textColor: "#222D34".hexaToUIColor(), font: UIFont(name: "SFProText-Medium", size: 32))
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: UI.Margin.XXS_MARGIN),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN)
        ])
        
        let descriptionLabel = buildLabel(text: detailViewModel.description, textColor: "#222D34".hexaToUIColor(), font: UIFont(name: "SFProText-Light", size: 16))
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: UI.Margin.L_MARGIN),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN)
        ])
        
        let priceLabel = buildLabel(text: "PRICE", textColor: "#222D34".hexaToUIColor(), font: UIFont(name: "SFProText-Regular", size: UI.FontSize.XXXS_MARGIN), numberOfLines: 1)
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: UI.Margin.XL_MARGIN),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN)
        ])
        
        let oldPriceView = UIView()
        oldPriceView.prepareForAutolayout(.clear)
        contentView.addSubview(oldPriceView)
        NSLayoutConstraint.activate([
            oldPriceView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: UI.Margin.XXS_MARGIN - 1),
            oldPriceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN),
            oldPriceView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN)
        ])

        let oldPriceLabel = buildLabel(text: detailViewModel.price.old.uppercased(), textColor: "#9DB0BD".hexaToUIColor(), font: UIFont(name: "SFProText-Regular", size: UI.FontSize.XS_MARGIN), numberOfLines: 1)
        oldPriceView.addSubview(oldPriceLabel)
        NSLayoutConstraint.activate([
            oldPriceLabel.topAnchor.constraint(equalTo: oldPriceView.topAnchor),
            oldPriceLabel.leadingAnchor.constraint(equalTo: oldPriceView.leadingAnchor),
            oldPriceLabel.trailingAnchor.constraint(equalTo: oldPriceView.trailingAnchor),
            oldPriceLabel.bottomAnchor.constraint(equalTo: oldPriceView.bottomAnchor)
        ])
        
        let lineView = UIView()
        lineView.prepareForAutolayout("#9DB0BD".hexaToUIColor())
        oldPriceView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.centerYAnchor.constraint(equalTo: oldPriceView.centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: oldPriceView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: oldPriceView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        let newPriceLabel = buildLabel(text: detailViewModel.price.new.uppercased(), textColor: "#222D34".hexaToUIColor(), font: UIFont(name: "SFProText-Medium", size: UI.FontSize.M_MARGIN), numberOfLines: 1)
        contentView.addSubview(newPriceLabel)
        NSLayoutConstraint.activate([
            newPriceLabel.centerYAnchor.constraint(equalTo: oldPriceView.centerYAnchor),
            newPriceLabel.leftAnchor.constraint(equalTo: oldPriceView.rightAnchor, constant: UI.Margin.XS_MARGIN + 2),
            newPriceLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN)
        ])
        
        let expirationLabel = buildLabel(text: detailViewModel.expiration, textColor: "#718897".hexaToUIColor(), font: UIFont(name: "SFProText-Regular", size: UI.FontSize.XXXS_MARGIN), numberOfLines: 1)
        contentView.addSubview(expirationLabel)
        NSLayoutConstraint.activate([
            expirationLabel.centerYAnchor.constraint(equalTo: newPriceLabel.centerYAnchor),
            expirationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN),
            expirationLabel.leftAnchor.constraint(greaterThanOrEqualTo: newPriceLabel.rightAnchor, constant: UI.Margin.XS_MARGIN + 2)
        ])
        
        let redemptionsCapLabel = buildLabel(text: "REDEMPTIONS CAP: " + detailViewModel.redemptionsCap.uppercased(), textColor: "#222D34".hexaToUIColor(), font: UIFont(name: "SFProText-Medium", size: UI.FontSize.XXS_MARGIN), numberOfLines: 1)
        contentView.addSubview(redemptionsCapLabel)
        NSLayoutConstraint.activate([
            redemptionsCapLabel.topAnchor.constraint(equalTo: oldPriceLabel.bottomAnchor, constant: UI.Margin.XL_MARGIN),
            redemptionsCapLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UI.Margin.L_MARGIN),
            redemptionsCapLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UI.Margin.L_MARGIN),
            redemptionsCapLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UI.Margin.XXS_MARGIN)
        ])
    }
    
    func buildLabel(text: String?, textColor: UIColor, font: UIFont?, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.prepareForAutolayout(.clear)
        label.text = text
        label.textAlignment = textAlignment
        label.textColor = textColor
        label.font = font
        label.numberOfLines = numberOfLines
        return label
    }
}   

// MARK: ScrollView
private extension OfferDetailViewController {
    func buildScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.prepareForAutolayout()
        return scrollView
    }
    
    func buildContentView() -> UIView {
        let contentView = UIView()
        contentView.prepareForAutolayout()
        return contentView
    }
}
