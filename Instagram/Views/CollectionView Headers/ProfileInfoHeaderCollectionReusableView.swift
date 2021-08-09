//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by kms on 2021/08/08.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTabPostButton(_header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTabFollowerButton(_header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTabFollowingButton(_header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTabEditProfileButton(_header: ProfileInfoHeaderCollectionReusableView)
}


final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follower", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("editProfile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Min Soo"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "First Account"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    //MARK: -Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    private func addSubview() {
        addSubview(profilePhotoImageView)
        addSubview(followingButton)
        addSubview(followerButton)
        addSubview(postsButton)
        addSubview(bioLabel)
        addSubview(nameLabel)
        addSubview(editProfileButton)
    }
    
    private func addButtonActions() {
        followerButton.addTarget(self, action: #selector(didTapFollowerButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //프로필 사진
        let profilePhotosize = width/4
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotosize, height: profilePhotosize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotosize/2.0
        
        // 프로필 옆 항목들 posts,follwers,following
        let buttonHeight = profilePhotosize/2
        let countButtonWidth = (width - 10 - profilePhotosize)/3
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followerButton.frame = CGRect(x: postsButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followingButton.frame = CGRect(x: followerButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: 5 + buttonHeight, width: countButtonWidth*3, height: buttonHeight).integral
        nameLabel.frame = CGRect(x: 5, y: 5 + profilePhotoImageView.bottom, width: width-10, height: 50).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(x: 5, y: 5 + nameLabel.bottom, width: width-10, height: bioLabelSize.height).integral
    }
    
    @objc private func didTapFollowerButton() {
        delegate?.profileHeaderDidTabFollowerButton(_header: self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTabFollowingButton(_header: self)
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTabPostButton(_header: self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTabEditProfileButton(_header: self)
    }
}
