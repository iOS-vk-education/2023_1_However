//
//  MainViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit
import FirebaseAuth

enum filterButtonOptions : String {
    case alphabet = "По алфавиту"
    case date = "По дате"
    case complexity = "По сложности"
    
    static let allOptions = [alphabet, date, complexity]
}


extension UIImage {
    static let filterImage = UIImage(named: "mainFilterImage")
}

protocol MainViewInput: AnyObject {
    /// Добавляет модуль.
    /// - Parameter vc: Модуль.
    func addModule(_ vc: UIViewController)
    func showDropdownFilterMenu(_ vc: UITableView)
    func addDeadlines(deadlines: [Deadline])
}

class MainViewController: UIViewController {
    
    var filterButtonTableView = UITableView()
    var collectionView: UICollectionView!
    
    // MARK: - Private properties
    
    private struct Constants {
        static let buttonSize = CGSize(width: 50.0, height: 50.0)
    }
    
    private var filterButton = UIButton()
    private var addDeadlineButton = UIButton()
    
    var deadlines: [Deadline] = []
    
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
        let uid = Auth.auth().currentUser?.uid
        self.output?.getUserDeadlines(collection: "deadlines", UserID: uid!)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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
        let tv = UITableView(frame: .zero)
        
        view.backgroundColor = UIColor.customBackGroundColor
        cv.backgroundColor = .customBackGroundColor
        tv.backgroundColor = .customBackGroundColor
        tv.tintColor = .customBackGroundColor
        tv.layer.borderWidth = 1.0
        
        

        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .medium)
        let symbolImage = UIImage(systemName: "plus", withConfiguration: symbolConfiguration)
        addDeadlineButton.setImage(symbolImage, for: .normal)
        addDeadlineButton.tintColor = UIColor.black
        addDeadlineButton.setTitleColor(.black, for: .normal)
        addDeadlineButton.backgroundColor = UIColor.customAccentColor
        addDeadlineButton.layer.cornerRadius = 15.0
        
        addDeadlineButton.addTarget(self, action: #selector(addDeadlineButtonTapped), for: .touchUpInside)
        
        
        view.addSubview(cv)
        view.addSubview(tv)
        view.addSubview(addDeadlineButton)
        
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        self.filterButtonTableView = tv
        filterButtonTableView.dataSource = self
        filterButtonTableView.delegate = self
    }
    
    @objc
    func addDeadlineButtonTapped(sender: UIButton) {
        self.output?.addDeadlineButtonDidTapped()
    }
    
    @objc
    func addButtonFilter(sender: UIButton){
        self.output?.addButtonFilterDidTapped(filterButtonTableView)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.deadlines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        
        let deadline = self.deadlines[indexPath.item]
        cell.mainText.text = deadline.title
        cell.emoji.text = EmojiComplexity.getEmojiFromValue(id: deadline.complexity)
        
        let timeDelta = TimeDelta.DaysBetween(Date(), and: deadline.date)
        cell.dayAmount.text = String(timeDelta) +  " \nдней"
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterButtonOptions.allOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filterButtonOptions.allOptions[indexPath.row].rawValue
        cell.backgroundColor = .white
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = filterButtonOptions.allOptions[indexPath.row]
        print("Selected option: \(selectedOption)")
        
        // Processing what filter option was tapped
        switch selectedOption {
        case filterButtonOptions.alphabet:
            self.deadlines.sort {
                $0.title < $1.title
            }
            self.collectionView.reloadData()
            
        case filterButtonOptions.complexity:
            self.deadlines.sort {
                $0.complexity > $1.complexity
            }
            self.collectionView.reloadData()
        case filterButtonOptions.date:
            self.deadlines.sort {
                $0.date < $1.date
            }
            self.collectionView.reloadData()
        }
        tableView.frame = CGRect(x: 20, y: 110, width: 170, height: 0)
    }
}

extension MainViewController: MainViewInput {
    
    func addModule(_ vc: UIViewController) {
        self.present(vc, animated: true)
    }
    
    func showDropdownFilterMenu(_ vc: UITableView){
        if vc.frame.height == 0 {
            vc.frame = CGRect(x: 20, y: 110, width: 170, height: 125)
        } else {
            vc.frame = CGRect(x: 20, y: 110, width: 170, height: 0)
        }
    }
    
    func addDeadlines(deadlines: [Deadline]){
        self.deadlines = deadlines
        self.collectionView.reloadData()
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

class filterButtonTableViewCell: UITableViewCell {
    
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
