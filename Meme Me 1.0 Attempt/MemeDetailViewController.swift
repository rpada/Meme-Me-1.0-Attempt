//
//  MemeDetailViewController.swift
//  Meme Me 1.0 Attempt
//
//  Created by Rianne Pada on 5/4/22.
//

import Foundation
import UIKit


class MemeDetailViewController: UIViewController {
    
        
    @IBOutlet weak var memedImage: UIImageView!
    
    var meme: Meme!
    
   override func viewWillAppear(_ animated: Bool) {
       // when the meme is clicked on it shows in the larger view
       super.viewWillAppear(animated)
       self.memedImage!.image = meme.memedImage
    }
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         self.tabBarController?.tabBar.isHidden = false
     }
    
}

