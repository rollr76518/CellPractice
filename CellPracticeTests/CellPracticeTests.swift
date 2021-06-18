//
/* 
 *		Created by 游宗諭 in 2021/6/18
 *		
 *		Using Swift 5.0
 *		
 *		Running on macOS 11.4
 */


import XCTest
@testable import CellPractice
class CellPracticeTests: XCTestCase {
    override func setUp() {
        MockCell.history.removeAll()
    }
    override func tearDown() {
        MockCell.history.removeAll()
    }
    func testA() {
        let sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "ViewController")
        sut.loadViewIfNeeded()
        sut.view.layoutIfNeeded()
        XCTAssertEqual(MockCell.history,
                       ["init(coder:)",
                        "object awakeFromNib()"]
                       )
    }
    func testB() {
        
        let sut = BViewController()
        sut.loadViewIfNeeded()
        sut.view.layoutIfNeeded()
        XCTAssertEqual(
            MockCell.history,
            ["init(style:reuseIdentifier:)"])
    }

}

