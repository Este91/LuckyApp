//
//  OfferSectionTableViewCell.swift
//  LuckyApp
//
//  Created by Esteban Boffa on 10/10/2020.
//  Copyright © 2020 EstebanBoffa. All rights reserved.
//

import Foundation
import UIKit

final class OfferSectionTableViewCell: UITableViewCell {

    static let cellIdentifier = "OfferSectionTableViewCell"
    private var label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellStyle()
        setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        clearLabel()
    }
}

// MARK: Setup cell
extension OfferSectionTableViewCell {
    func setupCell(data: OffersSectionData) {
        label.text = data.sectionTitle
    }
}

// MARK: Privates
private extension OfferSectionTableViewCell {
    func setupCellStyle() {
        backgroundColor = .white
        selectionStyle = .none
    }

    func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24) // poner la font correcta
        label.textColor = "#222D34".hexaToUIColor()
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
        ])
    }

    func clearLabel() {
        label.text = ""
    }
}
