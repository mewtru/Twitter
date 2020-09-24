//
//  ViewController.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import UIKit

class FeedViewController: UITableViewController {
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<String, Tweet>
    typealias DataSource = UITableViewDiffableDataSource<String, Tweet>

    lazy var dataSource = makeDataSource()
    private let loader = ModelLoader<TweetsResponse>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tweets"
        tabBarItem = .init(title: "Tweets", image: UIImage(systemName: "house.fill")!, tag: 0)
        
        tableView.register(TweetCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = dataSource
        
        let refreshAction = UIAction { [weak self] _ in
            self?.refresh(animated: true)
        }
        
        tableView.refreshControl = UIRefreshControl(frame: .zero, primaryAction: refreshAction)
        
        refresh(animated: false)
    }
    
    func refresh(animated: Bool) {
        loader.load(at: "http://localhost:4000/api/tweets") { [weak self] response in
            self?.tableView.refreshControl?.endRefreshing()
            self?.display(tweets: response.tweets, animated: animated)
        }
    }
    
    func display(tweets: [Tweet], animated: Bool) {
        var snapshot = Snapshot()
        snapshot.appendSections(["Tweets"])
        snapshot.appendItems(tweets)
        dataSource.apply(snapshot, animatingDifferences: animated)
    }

    func makeDataSource() -> DataSource {
        return DataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetCell
            cell.handleLabel.text = item.user.name
            cell.tweetLabel.text = item.text
            cell.avatarView.url = item.user.avatar
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tweet = dataSource.itemIdentifier(for: indexPath)!
        let viewController = ProfileViewController(user: tweet.user)
        show(viewController, sender: self)
    }
}

