//
//  TweetCell.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import UIKit

class TweetCell: UITableViewCell {
    
    let avatarView = RoundImageView()
    let handleLabel = UILabel()
    let tweetLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        contentView.addSubview(avatarView)
        contentView.addSubview(handleLabel)
        contentView.addSubview(tweetLabel)
        
        let leftSpacing : CGFloat = 16
        
        avatarView.pinEdges([.left, .top], to: contentView.layoutMarginsGuide)
        avatarView.pinSize(to: 44)
        
        handleLabel.centerYAnchor.pin(to: avatarView.centerYAnchor)
        handleLabel.leadingAnchor.pin(to: avatarView.trailingAnchor, constant: leftSpacing)
        
        tweetLabel.topAnchor.pin(to: handleLabel.bottomAnchor, constant: 8)
        tweetLabel.leadingAnchor.pin(to: handleLabel.leadingAnchor)
        tweetLabel.pinEdges([.bottom, .right], to: contentView.layoutMarginsGuide)
        
        tweetLabel.numberOfLines = 0
        avatarView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
