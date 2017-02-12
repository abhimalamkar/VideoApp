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
        
        setupMenuBar()
    }
    
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
    
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    //returns a cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
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

