//
//  MainViewController.swift
//  Odnako
//
//  Created by User on 20.11.2023.
//

import UIKit
import FirebaseAuth

protocol MainViewInput: AnyObject {
    /// Добавляет модуль.
    /// - Parameter vc: Модуль.
    func addModule(_ vc: UIViewController)
    func showDropdownFilterMenu(_ vc: UITableView)
    func addDeadlines(deadlines: [Deadline])
}

protocol AddDeadlineDelegate: AnyObject {
    func didAddNewDeadline()
}

protocol EditDeadlineDelegate: AnyObject {
    func didEditDeadline()
}

class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    var filterButtonTableView = UITableView()
    private var collectionView: UICollectionView!
    private var filterButton = UIButton()
    private var deadlineButton = UIButton()
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
    
    private func addFilterTableView() {
        let tv = UITableView(frame: .zero)
        tv.backgroundColor = .customBackGroundColor
        tv.tintColor = .customBackGroundColor
        tv.layer.borderWidth = 1.0
        view.addSubview(tv)
        tv.translatesAutoresizingMaskIntoConstraints = false
        self.filterButtonTableView = tv
    }
    
    private func configureUI() {
        self.addFilterButton()
        self.addDeadlineButton()
        self.addCollectionView()
        self.addFilterTableView()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: Identifier.cellIdentifier)
        
        filterButtonTableView.dataSource = self
        filterButtonTableView.delegate = self
    }
    
    @objc
    func addDeadlineButtonTapped(sender: UIButton) {
        let addDeadlineVC = addDeadLineViewController()
        addDeadlineVC.addDeadlineDelegate = self
        self.output?.addDeadlineButtonDidTapped(addDeadlineVC)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.cellIdentifier, for: indexPath) as! MainCell
        
        let deadline = self.deadlines[indexPath.item]
        cell.mainText.text = deadline.title
        cell.emoji.text = EmojiComplexity.getEmojiFromValue(id: deadline.complexity)
        if deadline.hasDate {
            let timeDelta = TimeDelta.DaysBetween(Date(), and: deadline.date)
            cell.dayAmount.text = String(timeDelta) +  " \nдней"
        } else {
            cell.dayAmount.text = Deadline.noDate
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDeadline = deadlines[indexPath.item]

        let alertController = UIAlertController(title: "Выбрана задача \(selectedDeadline.title)", message: "Следующие действия:", preferredStyle: .actionSheet)
        
        let completeDeadline = UIAlertAction(title: "Завершить", style: .default) { _ in
            if let cell = collectionView.cellForItem(at: indexPath) as? MainCell {
                cell.contentView.backgroundColor = .green
            }
        }
        alertController.addAction(completeDeadline)
        
        let editDeadline = UIAlertAction(title: "Открыть", style: .default) { _ in
            let editDeadlineVC = updateDeadLineViewController()
            editDeadlineVC.editDeadlineDelegate = self
            editDeadlineVC.deadline = selectedDeadline
            self.output?.updateDeadlineButtonDidTapped(editDeadlineVC)
            self.collectionView.reloadData()
        }
        alertController.addAction(editDeadline)
        
        let deleteDeadline = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            self.deadlines.remove(at: indexPath.item)
            self.collectionView.deleteItems(at: [indexPath])
            APIManager.shared.deleteDeadlineFromFirestore(collection: "deadlines", deadline: selectedDeadline)
            self.collectionView.reloadData()
        }
        alertController.addAction(deleteDeadline)
        
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
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
            self.deadlines = SortingDeadline.sortByTitle(deadlines: self.deadlines)
            self.collectionView.reloadData()
    
        case filterButtonOptions.complexity:
            self.deadlines = SortingDeadline.sortByComplexity(deadlines: self.deadlines)
            self.collectionView.reloadData()
            
        case filterButtonOptions.date:
            self.deadlines = SortingDeadline.sortByDate(deadlines: self.deadlines)
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

extension MainViewController: AddDeadlineDelegate {
    func didAddNewDeadline() {
        let uid = Auth.auth().currentUser?.uid
        output?.getUserDeadlines(collection: "deadlines", UserID: uid!)
        
    }
}

extension MainViewController: EditDeadlineDelegate {
    func didEditDeadline() {
        let uid = Auth.auth().currentUser?.uid
        output?.getUserDeadlines(collection: "deadlines", UserID: uid!)
    }
}
