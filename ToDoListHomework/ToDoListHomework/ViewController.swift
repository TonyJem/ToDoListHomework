import UIKit

class ViewController: UIViewController {
    
    private let contacts = ContactAPI.getContacts()

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
        
        setNavigation()
        
        addSubviewsToMainView()
        setConstraintsToTableView()
    }
}

extension ViewController {
    
    func setNavigation() {
     navigationItem.title = "Contacts"
     self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
     self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    func addSubviewsToMainView() {
        view.addSubview(contactsTableView)
    }
    
    func setConstraintsToTableView() {
        NSLayoutConstraint.activate([
            contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
}
