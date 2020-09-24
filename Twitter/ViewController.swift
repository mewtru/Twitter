//
//  ViewController.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import UIKit

class FeedViewController: UITableViewController {

    lazy var dataSource = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TweetCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["Section"])
        snapshot.appendItems(["Kyle", "is", "super", "cool"])
        dataSource.apply(snapshot)
    }

    func makeDataSource() -> UITableViewDiffableDataSource<String, String> {
        return UITableViewDiffableDataSource<String, String>(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetCell
            cell.handleLabel.text = "@mewtru"
            cell.tweetLabel.text = "Hello world!"
            return cell
        }
    }
}

