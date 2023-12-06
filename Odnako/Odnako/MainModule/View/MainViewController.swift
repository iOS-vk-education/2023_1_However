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


extension UIImage {
    
    static let filterImage = UIImage(named: "mainFilterImage")
}
protocol MainViewInput: AnyObject {
    
    /// Добавляет модуль.
    /// - Parameter vc: Модуль.
    func addModule(_ vc: UIViewController)
}

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    // MARK: - Private properties
    
    private struct Constants {
        static let buttonSize = CGSize(width: 50.0, height: 50.0)
    }
    
    private var filterButton = UIButton()
    private var addDeadlineButton = UIButton()
    
    private var output: MainPresenterOutput?
    
    // MARK: - Init
    
    init(output: MainPresenterOutput?) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.output?.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func addFilterButton() {
        filterButton.setImage(.filterImage, for: .normal)
        filterButton.backgroundColor = .customAccentColor
        filterButton.layer.cornerRadius = 15.0
        filterButton.addTarget(self, action: #selector(addButtonFilter), for: .touchUpInside)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterButton)
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            filterButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height),
            filterButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width)
        ])
    }
    
    private func addCollectionView() {
        
    }
    
    private func configureUI() {
        self.addFilterButton()
        self.addCollectionView()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        view.backgroundColor = UIColor.customBackGroundColor
        cv.backgroundColor = UIColor.customBackGroundColor
        
        

        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .medium)
        let symbolImage = UIImage(systemName: "plus", withConfiguration: symbolConfiguration)
        addDeadlineButton.setImage(symbolImage, for: .normal)
        addDeadlineButton.tintColor = UIColor.black
        addDeadlineButton.setTitleColor(.black, for: .normal)
        addDeadlineButton.backgroundColor = UIColor.customAccentColor
        addDeadlineButton.layer.cornerRadius = 15.0
        
        addDeadlineButton.addTarget(self, action: #selector(addDeadlineButtonTapped), for: .touchUpInside)
        
        
        view.addSubview(cv)
        view.addSubview(addDeadlineButton)
        
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        addDeadlineButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            addDeadlineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addDeadlineButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addDeadlineButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width),
            addDeadlineButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height)
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
    func addDeadlineButtonTapped(sender: UIButton) {
        self.output?.addDeadlineButtonDidTapped()
    }
    
    @objc
    func addButtonFilter(sender: UIButton){
        self.output?.addButtonFilterDidTapped()
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

extension MainViewController: MainViewInput {
    
    func addModule(_ vc: UIViewController) {
        self.present(vc, animated: true)
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
