//
//  BViewController.swift
//  CellPractice
//
//  Created by Ryan on 2021/6/18.
//

import UIKit

class BViewController: UIViewController {

    lazy var tableView: UITableView = makeTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ]
        )
    }
}

extension BViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ATableViewCell", for: indexPath) as! ATableViewCell
        cell.setup(text: "\(indexPath)")
        return cell
    }
}

extension BViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(MockCell.self, forCellReuseIdentifier: "ATableViewCell")
        return tableView
    }
}
