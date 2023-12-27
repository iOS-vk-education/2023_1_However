//
//  MainCell.swift
//  Odnako
//
//  Created by Cyril Kardash on 14.12.2023.
//

import UIKit

class MainCell: UICollectionViewCell {
    let dayAmount = UILabel()
    let emoji = UILabel()
    let mainText = UILabel()
    private let deadlineLeftView = UIView()
    private let deadlineRightView = UIView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(deadlineLeftView)
        contentView.addSubview(deadlineRightView)
        deadlineLeftView.addSubview(dayAmount)
        deadlineRightView.addSubview(emoji)
        contentView.addSubview(mainText)


        deadlineLeftView.translatesAutoresizingMaskIntoConstraints = false
        deadlineRightView.translatesAutoresizingMaskIntoConstraints = false
        dayAmount.translatesAutoresizingMaskIntoConstraints = false
        emoji.translatesAutoresizingMaskIntoConstraints = false
        mainText.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            deadlineLeftView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            deadlineLeftView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/4.8),
            deadlineLeftView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
        deadlineLeftView.layer.cornerRadius = 30
        deadlineLeftView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        deadlineLeftView.backgroundColor = UIColor.customDeadlineCellColor
        deadlineLeftView.layer.borderWidth = 1.0
        deadlineLeftView.layer.borderColor = UIColor.black.cgColor

        NSLayoutConstraint.activate([
            deadlineRightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deadlineRightView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/4.8),
            deadlineRightView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
        deadlineRightView.layer.cornerRadius = 30
        deadlineRightView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        deadlineRightView.backgroundColor = UIColor.customDeadlineCellColor
        deadlineRightView.layer.borderWidth = 1.0
        deadlineRightView.layer.borderColor = UIColor.black.cgColor
        

        NSLayoutConstraint.activate([
            dayAmount.topAnchor.constraint(equalTo: contentView.topAnchor),
            dayAmount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dayAmount.centerXAnchor.constraint(equalTo: deadlineLeftView.centerXAnchor),
            dayAmount.centerYAnchor.constraint(equalTo: deadlineLeftView.centerYAnchor)
        ])


        NSLayoutConstraint.activate([
            emoji.topAnchor.constraint(equalTo: contentView.topAnchor),
            emoji.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            emoji.centerXAnchor.constraint(equalTo: deadlineRightView.centerXAnchor),
            emoji.centerYAnchor.constraint(equalTo: deadlineRightView.centerYAnchor)
        ])
        dayAmount.textAlignment = .center
        dayAmount.numberOfLines = 0
        emoji.font = UIFont.systemFont(ofSize: 30)

        NSLayoutConstraint.activate([
            mainText.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainText.leadingAnchor.constraint(equalTo: deadlineLeftView.leadingAnchor, constant: 80),
            mainText.trailingAnchor.constraint(equalTo: deadlineRightView.trailingAnchor, constant: -80)
        ])

        mainText.textAlignment = .center
        mainText.numberOfLines = 0
        mainText.font = .boldSystemFont(ofSize: 20)
        mainText.adjustsFontSizeToFitWidth = true

        //contentView.backgroundColor = UIColor.customDeadlineMainColor
        contentView.layer.cornerRadius = 30

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
