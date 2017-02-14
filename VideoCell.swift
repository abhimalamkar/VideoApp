//
//  VideoCell.swift
//  VideoApp
//
//  Created by Abhijeet Malamkar on 2/12/17.
//  Copyright © 2017 abhijeetmalamkar. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame :CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell{
    
    var video: Video? {
        didSet{
         titleLabel.text = video?.title
            if let thumbnailImageName = video?.thumbnailImage {
               thumbnailImageView.image = UIImage(named: thumbnailImageName)
            }else { thumbnailImageView.backgroundColor = UIColor.lightGray }
            if let profileImageName = video?.channel?.profileImageName {
                userProfileImageView.image = UIImage(named: profileImageName)
            }
            if let channelName = video?.channel?.name ,let numberOfView = video?.numberOfView {
                
                let numberFormater = NumberFormatter()
                numberFormater.numberStyle = .decimal
                
                let bulletPoint: String = "\u{2022}"
                let subTitleText = "\(channelName) \(bulletPoint) \(numberFormater.string(from: numberOfView)!)"
                subtitleTextView.text = subTitleText
            }
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.backgroundColor = UIColor.lightGray
        // imageVIew.backgroundColor = UIColor.lightGray
        //imageVIew.image = video.thu
        imageVIew.contentMode = .scaleAspectFill
        imageVIew.clipsToBounds = true
        return imageVIew
    }()
    
    let detailBackground:UIView = {
       let view = UIView()
       view.backgroundColor = UIColor.lightGray
       return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        //label.text = video.title
        //label.backgroundColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let view = UITextView()
        //view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        view.textColor = UIColor.lightGray
        return view
    }()
    
    let userProfileImageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.backgroundColor = UIColor.gray
        imageVIew.contentMode = .scaleAspectFill
        imageVIew.clipsToBounds = true
        imageVIew.layer.cornerRadius = 22
        imageVIew.layer.masksToBounds = true
        return imageVIew
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    override func setupViews(){
        
        //adding image view
        addSubview(thumbnailImageView)
        //seperator lines
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(detailBackground)
        
        //setting contraints for image view
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        
        //setting contraints for seperator view
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": seperatorView]))
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": seperatorView]))
        
        
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        //addConstrainsWithFormat(format: "V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView,seperatorView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: seperatorView)
        
        //userprofile imageview
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView,seperatorView)
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]|", views: userProfileImageView)
        
        //addConstrainsWithFormat(format: "V:|-16-[v0]-16-[v1(1)]|", views: thumbnailImageView,seperatorView)
        //addConstrainsWithFormat(format: "H:|-16-[v0(44)]|", views: userProfileImageView)

        //top contsraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        
        //addConstrainsWithFormat(format: "V:[v0(20)]", views: titleLabel)
        //addConstrainsWithFormat(format: "V:|[v0]|", views: titleLabel)
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        
        
    }
    
}


