//
//  ViewController.swift
//  CellPractice
//
//  Created by Ryan on 2021/6/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ATableViewCell", for: indexPath) as! ATableViewCell
        cell.setup(text: "\(indexPath)")
        return cell
    }
}

class ATableViewCell: UITableViewCell {

    @IBOutlet weak var aLabel: UILabel!

    func setup(text: String?) {
        aLabel.text = text
    }
}
