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
        return 1
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
        aLabel?.text = text
    }
}

class MockCell: ATableViewCell {
    static var history:[String] = []
    override class func awakeFromNib() {
        super.awakeFromNib()
        history.append("static \(#function)")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        Self.history.append("object \(#function)")
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Self.history.append(#function)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        Self.history.append(#function)
    }
}
