import UIKit


class FilerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let dropdownOptions = ["Option 1", "Option 2", "Option 3", "Option 4"]
    var dropdownButton = UIButton()

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set button properties
        dropdownButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        dropdownButton.setTitle("Select Option", for: .normal)
        dropdownButton.setTitleColor(.black, for: .normal)
        dropdownButton.backgroundColor = .lightGray
        dropdownButton.layer.cornerRadius = 8
        dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)

        // Set tableView properties
        tableView.frame = CGRect(x: 100, y: 140, width: 200, height: 0)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(dropdownButton)
        view.addSubview(tableView)
    }

    @objc func dropdownButtonTapped() {
        if tableView.frame.height == 0 {
            tableView.frame = CGRect(x: 100, y: 140, width: 200, height: 120)
        } else {
            tableView.frame = CGRect(x: 100, y: 140, width: 200, height: 0)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = dropdownOptions[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropdownButton.setTitle(dropdownOptions[indexPath.row], for: .normal)
        tableView.frame = CGRect(x: 100, y: 140, width: 200, height: 0)
    }
}

// To use the dropdown menu
let viewController = FilerViewController()
// Present the dropdown view controller as needed
// For example, if you are using a navigation controller:
// navigationController?.pushViewController(viewController, animated: true)
