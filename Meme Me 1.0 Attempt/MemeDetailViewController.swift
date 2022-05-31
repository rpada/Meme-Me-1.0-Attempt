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
          super.viewWillAppear(animated)
          
        self.memedImage!.image = meme.memedImage

      }
    
}
