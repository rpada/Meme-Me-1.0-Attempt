//
//  SentMemesTableViewController.swift
//  Meme Me 1.0 Attempt
//
//  Created by Brenna Pada on 5/3/22.
//

import Foundation
import UIKit

class SentMemesTableViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
}
