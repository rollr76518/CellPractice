//
//  BViewController.swift
//  CellPractice
//
//  Created by Ryan on 2021/6/18.
//

import UIKit

class BViewController: UIViewController {

    private lazy var tableView: UITableView = makeTableView()

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
    lazy var sourceTableView:UITableView = makeSourceTableView()
}

extension BViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sourceTableView.dequeueReusableCell(withIdentifier: "ATableViewCell", for: indexPath) as! ATableViewCell
        cell.setup(text: "\(indexPath)")
        return cell
    }
}

extension BViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(ATableViewCell.self, forCellReuseIdentifier: "ATableViewCell")
        return tableView
    }
    func makeSourceTableView() -> UITableView {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        vc.view.layoutIfNeeded()
        return vc.tableView
    }
}
