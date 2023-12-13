//
//  MainViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit

protocol MainViewInput: AnyObject {
    /// Добавляет модуль.
    /// - Parameter vc: Модуль.
    func addModule(_ vc: UIViewController)
}

class MainViewController: UIViewController {
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var filterButton = UIButton()
    private var deadlineButton = UIButton()
    private var output: MainPresenterOutput?
    private var data = TaskData()
    
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
            filterButton.heightAnchor.constraint(equalToConstant: Constants.buttonSizeForMain.height),
            filterButton.widthAnchor.constraint(equalToConstant: Constants.buttonSizeForMain.width)
        ])
    }
    
    private func addDeadlineButton() {
        deadlineButton.setImage(.addImage, for: .normal)
        deadlineButton.tintColor = .black
        deadlineButton.setTitleColor(.black, for: .normal)
        deadlineButton.backgroundColor = .customAccentColor
        deadlineButton.layer.cornerRadius = 15.0
        deadlineButton.addTarget(self, action: #selector(addDeadlineButtonTapped), for: .touchUpInside)
        deadlineButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deadlineButton)
        NSLayoutConstraint.activate([
            deadlineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            deadlineButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            deadlineButton.widthAnchor.constraint(equalToConstant: Constants.buttonSizeForMain.width),
            deadlineButton.heightAnchor.constraint(equalToConstant: Constants.buttonSizeForMain.height)
        ])
    }
    
    private func addCollectionView() {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .customBackGroundColor
        cv.backgroundColor = .customBackGroundColor
        view.addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 15.0),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        self.collectionView = cv
    }
    
    private func configureUI() {
        self.addFilterButton()
        self.addDeadlineButton()
        self.addCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: Identifier.cellIdentifier)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.cellIdentifier, for: indexPath) as! MainCell
        fillData(cell)
        return cell
    }
    
    func fillData(_ cell: MainCell) -> Void {
        cell.dayAmount.text = data.amountDay
        cell.emoji.text = data.emoji
        cell.mainText.text = data.task
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

