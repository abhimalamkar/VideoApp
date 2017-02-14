//
//  ViewController.swift
//  VideoApp
//
//  Created by Abhijeet Malamkar on 2/11/17.
//  Copyright © 2017 abhijeetmalamkar. All rights reserved.
//

import UIKit

//added uicollection view controller for collection
class HomeViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    var videos:[Video] = {
        var channel = Channel()
        channel.name = "DownBoost"
        channel.profileImageName = "profile"
        
        var video = Video()
        video.title = "Abhijeet Malamkar"
        video.thumbnailImage = "1"
        video.channel = channel
        video.numberOfView = 2131231432413543
        return [video]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      //navigation item
      navigationItem.title = "Home"
      navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        navigationItem.titleView = titleLabel
        
        //collection view does not comes with a color so define it
         collectionView?.backgroundColor = UIColor.white
        
         collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons(){
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let moreButton = UIBarButtonItem(image: UIImage(named:"nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
     navigationItem.rightBarButtonItems = [moreButton,searchBarButtonItem]
        
    }
    
    func handleSearch(){
    print("search")
    }
    
    func handleMore(){
        print("more")
    }
    
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstrainsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstrainsWithFormat(format: "V:|[v0(50)]|", views: menuBar)

    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    //returns a cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    //for creation of collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //setting the size of cell object
        let height = (view.frame.width - 32) * 9 / 16 + 80
        return CGSize(width: view.frame.width, height: height)
    }
    
    //for line spacing between objects
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

