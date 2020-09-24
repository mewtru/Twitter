//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import UIKit

class ProfileViewController : UIViewController {
    let avatarView = RoundImageView()
    let handleLabel = UILabel()
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        
        avatarView.url = user.avatar
        handleLabel.text = user.name
        
        tabBarItem = .init(title: "Profile", image: UIImage(systemName: "person.fill")!, tag: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(avatarView)
        view.addSubview(handleLabel)
        
        view.backgroundColor = .systemBackground
        
        avatarView.pinEdges([.left, .top], to: view.layoutMarginsGuide)
        avatarView.pinSize(to: 60)
        avatarView.backgroundColor = .purple
        
        handleLabel.centerYAnchor.pin(to: avatarView.centerYAnchor)
        handleLabel.leadingAnchor.pin(to: avatarView.trailingAnchor, constant: 16)
        
    }
}
