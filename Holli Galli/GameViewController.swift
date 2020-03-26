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
        if imageViewArray.count == 1
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
        }
        else if imageViewArray.count == 2
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
        }
        else if imageViewArray.count == 3
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
            imageViewArray[2].frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[2])
        }
        else if imageViewArray.count == 4
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
            imageViewArray[2].frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[2])
            imageViewArray[3].frame = CGRect(x: 321, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[3])
        }
        else if imageViewArray.count == 5
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
            imageViewArray[2].frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[2])
            imageViewArray[3].frame = CGRect(x: 321, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[3])
            imageViewArray[4].frame = CGRect(x: 619, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[4])
        }
        else if imageViewArray.count  == 6
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
            imageViewArray[2].frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[2])
            imageViewArray[3].frame = CGRect(x: 321, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[3])
            imageViewArray[4].frame = CGRect(x: 619, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[4])
            imageViewArray[5].frame = CGRect(x: 619, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[5])
        }
        else if imageViewArray.count  == 7
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
            imageViewArray[2].frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[2])
            imageViewArray[3].frame = CGRect(x: 321, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[3])
            imageViewArray[4].frame = CGRect(x: 619, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[4])
            imageViewArray[5].frame = CGRect(x: 619, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[5])
            imageViewArray[6].frame = CGRect(x: 894, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[6])
        }
        else if imageViewArray.count == 8
        {
            imageViewArray[0].frame = CGRect(x: 20, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[0])
            imageViewArray[1].frame = CGRect(x: 20, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[1])
            imageViewArray[2].frame = CGRect(x: 321, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[2])
            imageViewArray[3].frame = CGRect(x: 321, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[3])
            imageViewArray[4].frame = CGRect(x: 619, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[4])
            imageViewArray[5].frame = CGRect(x: 619, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[5])
            imageViewArray[6].frame = CGRect(x: 894, y: 0, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[6])
            imageViewArray[7].frame = CGRect(x: 894, y: 549, width: 165.75, height: 260.25)
            view.addSubview(imageViewArray[7])
        }//end of if statements
        for image in imageViewArray
        {
            image.image = UIImage(named: "B.1.1")
            //image.transform =  CGAffineTransform(rotationAngle: -70)
        }
    }//end of placeImageView
    

}//end of class
