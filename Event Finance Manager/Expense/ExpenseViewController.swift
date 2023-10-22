//
//  ExpenseViewController.swift
//  Event Finance Manager
//
//  Created by Saikiran Panuganti on 14/04/22.
//

import UIKit

class ExpenseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    func setUpUI() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 80)
        tableView.register(UINib(nibName: "ExpenseTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpenseTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        addButton.layer.cornerRadius = 30.0
        addButton.clipsToBounds = true
    }

    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addTapped() {
        let controller = AddExpenseViewController(nibName: "AddExpenseViewController", bundle: nil)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ExpenseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as? ExpenseTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
}

extension ExpenseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
