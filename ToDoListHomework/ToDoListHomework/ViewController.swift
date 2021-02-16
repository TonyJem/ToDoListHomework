// Ideas from:
// https://dev.to/amclv/building-a-uitableview-programmatically-4e3m
// https://softauthor.com/ios-uitableview-programmatically-in-swift/

import UIKit

class ViewController: UIViewController {

    let contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        addSubviewsToMainView()
        setConstraintsToTableView()
    }
}

extension ViewController {
    func addSubviewsToMainView() {
        view.addSubview(contactsTableView)
    }

    func setConstraintsToTableView() {
        NSLayoutConstraint.activate([
            contactsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            contactsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contactsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
