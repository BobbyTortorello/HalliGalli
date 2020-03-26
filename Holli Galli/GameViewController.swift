//
//  GameViewController.swift
//  Holli Galli
//
//  Created by Jack Delahunty on 3/24/20.
//  Copyright © 2020 App Industries Inc. All rights reserved.
//

import UIKit
import Firebase

class GameViewController: UIViewController {
    
    private var playerNames: [PlayerNames] = []
    private var documents: [DocumentSnapshot] = []

    var imageViewArray = [UIImageView]()
    
    let db = Firestore.firestore()
    
    var playerCount = Int()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad()
    {
        super.viewDidLoad()
        createImageView()
    }

    func createImageView()
    {

        if defaults.integer(forKey: "playerCount") == 1
        {
            let imageView = UIImageView()
            imageViewArray.append(imageView)
        }
        else if defaults.integer(forKey: "playerCount") == 2
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)

        }
        else if defaults.integer(forKey: "playerCount") == 3
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            let imageView3 = UIImageView()

            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)
            imageViewArray.append(imageView3)
        }
        else if defaults.integer(forKey: "playerCount") == 4
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            let imageView3 = UIImageView()
            let imageView4 = UIImageView()

            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)
            imageViewArray.append(imageView3)
            imageViewArray.append(imageView4)

        }
        else if defaults.integer(forKey: "playerCount") == 5
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            let imageView3 = UIImageView()
            let imageView4 = UIImageView()
            let imageView5 = UIImageView()

            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)
            imageViewArray.append(imageView3)
            imageViewArray.append(imageView4)
            imageViewArray.append(imageView5)


        }
        else if defaults.integer(forKey: "playerCount") == 6
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            let imageView3 = UIImageView()
            let imageView4 = UIImageView()
            let imageView5 = UIImageView()
            let imageView6 = UIImageView()

            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)
            imageViewArray.append(imageView3)
            imageViewArray.append(imageView4)
            imageViewArray.append(imageView5)
            imageViewArray.append(imageView6)


        }
        else if defaults.integer(forKey: "playerCount") == 7
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            let imageView3 = UIImageView()
            let imageView4 = UIImageView()
            let imageView5 = UIImageView()
            let imageView6 = UIImageView()
            let imageView7 = UIImageView()

            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)
            imageViewArray.append(imageView3)
            imageViewArray.append(imageView4)
            imageViewArray.append(imageView5)
            imageViewArray.append(imageView6)
            imageViewArray.append(imageView7)


        }
        else if defaults.integer(forKey: "playerCount") == 8
        {
            let imageView = UIImageView()
            let imageView2 = UIImageView()
            let imageView3 = UIImageView()
            let imageView4 = UIImageView()
            let imageView5 = UIImageView()
            let imageView6 = UIImageView()
            let imageView7 = UIImageView()
            let imageView8 = UIImageView()

            imageViewArray.append(imageView)
            imageViewArray.append(imageView2)
            imageViewArray.append(imageView3)
            imageViewArray.append(imageView4)
            imageViewArray.append(imageView5)
            imageViewArray.append(imageView6)
            imageViewArray.append(imageView7)
            imageViewArray.append(imageView8)


        }
        if imageViewArray.isEmpty == false
        {
            placeImageViews()
            print("we working bitch")
        }
        else
        {
            print("this bitch empty, YEET")
        }
    }//end of createImageView
    
    func placeImageViews()
    {
        for imageView in imageViewArray
        {
            if imageView == imageViewArray[0]
            {
                imageView.frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[1]
            {
                imageView.frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[2]
            {
                imageView.frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[3]
            {
                imageView.frame = CGRect(x: 321, y: 549, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[4]
            {
                imageView.frame = CGRect(x: 619, y: 0, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[5]
            {
                imageView.frame = CGRect(x: 619, y: 549, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[6]
            {
                imageView.frame = CGRect(x: 894, y: 0, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
            if imageView == imageViewArray[7]
            {
                imageView.frame = CGRect(x: 894, y: 549, width: 165.75, height: 260.25)
                view.addSubview(imageView)
            }
        }//end of for loop
    }//end of placeImageView
}//end of class
