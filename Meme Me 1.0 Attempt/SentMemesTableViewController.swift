//
//  SentMemesTableViewController.swift
//  Meme Me 1.0 Attempt
//
//  Created by Brenna Pada on 5/3/22.
//

import Foundation
import UIKit
class SentMemesTableViewController: UITableViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         tableView.reloadData()
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return memes.count
     }
    
    class MemeTableViewCell: UITableViewCell {
        @IBOutlet weak var memeImage: UIImageView!
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath)
         let meme = getMeme(indexPath: indexPath)
         
         cell.textLabel!.text = meme.topText + " " + meme.bottomText
         cell.imageView?.image = meme.memedImage
         return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let detailViewController = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
         detailViewController.meme = getMeme(indexPath: indexPath)
     
         navigationController!.pushViewController(detailViewController, animated: true)
     }
     func getMeme(indexPath: IndexPath) -> Meme {
         return memes[(indexPath as NSIndexPath).row]
     }
 }


