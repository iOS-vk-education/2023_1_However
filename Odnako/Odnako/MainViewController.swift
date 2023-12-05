//
//  MainViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

extension UIColor{
    static let customBackGroundColor = UIColor.white
    static let customDeadlineMainColor = UIColor(red: 224/255, green: 193/255, blue: 255/255, alpha: 1.0)
    static let customDeadlineCellColor = UIColor(red: 210/255, green: 172/255, blue: 249/255, alpha: 1.0)
    static let customTabBarColor = UIColor(red: 197/255, green: 168/255, blue: 228/255, alpha: 1.0)
    static let customAccentColor = UIColor(red: 175/255, green: 120/255, blue: 234/255, alpha: 1.0)
    static let customDarkPurpleColor = UIColor.purple // темно-фиолетовый
    static let customLightPurpleColor = UIColor(red: 190/255, green: 179/255, blue: 228/255, alpha: 1.0) // фиолетовый
    static let customBackGroundColor_new = UIColor.white
}

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView!
    private var filterButton = UIButton()
    private var addDeadlineButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        view.backgroundColor = UIColor.customBackGroundColor
        cv.backgroundColor = UIColor.customBackGroundColor
        
        let buttonImage = UIImage(named: "mainFilterImage")
        filterButton.setImage(buttonImage, for: .normal)
        filterButton.backgroundColor = UIColor.customAccentColor
        filterButton.layer.cornerRadius = 15
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium)
        let symbolImage = UIImage(systemName: "plus", withConfiguration: symbolConfiguration)
        addDeadlineButton.setImage(symbolImage, for: .normal)
        addDeadlineButton.tintColor = UIColor.black
        addDeadlineButton.setTitleColor(.black, for: .normal)
        addDeadlineButton.backgroundColor = UIColor.customAccentColor
        addDeadlineButton.layer.cornerRadius = 15
        
        addDeadlineButton.addTarget(self, action: #selector(addButtonTouched), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(addButtonFilter), for: .touchUpInside)
        
        view.addSubview(cv)
        view.addSubview(addDeadlineButton)
        view.addSubview(filterButton)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        addDeadlineButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            filterButton.heightAnchor.constraint(equalToConstant: 50),
            filterButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            addDeadlineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addDeadlineButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addDeadlineButton.widthAnchor.constraint(equalToConstant: 50),
            addDeadlineButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 15),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        self.collectionView = cv
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCell")
    }
    
    @objc
    func addButtonTouched (sender: UIButton){
        present(addDeadLineViewController(), animated: true)
    }
    
    @objc
    func addButtonFilter (sender: UIButton){
        print("Button tapped!")
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.dayAmount.text = String(17) + " \nдней"
        cell.emoji.text = "💀"
        cell.mainText.text = "Check all emails please"
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

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
        
        contentView.backgroundColor = UIColor.customDeadlineMainColor
        contentView.layer.cornerRadius = 30
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
