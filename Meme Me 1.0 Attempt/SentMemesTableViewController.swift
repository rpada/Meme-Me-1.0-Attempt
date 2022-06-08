//
//  SentMemesTableViewController.swift
//  Meme Me 1.0 Attempt
//
//  Created by Rianne Pada on 5/3/22.
//

import Foundation
import UIKit
class SentMemesTableViewController: UITableViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //from Udacity Lession 8.5 Code for Using a Shared Model
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         //from Udacity Lession 8.13 Setting up a Troubleshooting Collection Views
         tableView.reloadData()
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return memes.count
     }
    
    class MemeTableViewCell: UITableViewCell {
        @IBOutlet weak var memeImage: UIImageView!
    }
    
    //from Udacity Lession 8.8 Setup the Sent Memes Collection View
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath)
         let meme = getMeme(indexPath: indexPath)
         
         // Set the name and image
         // so the image and text will show in the table row
         cell.imageView?.image = meme.memedImage
         
         cell.textLabel!.text = meme.topText + " " + meme.bottomText
         
         return cell
     }
    
    //from Udacity Lession 8.8 Setup the Sent Memes Collection View
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // Grab the DetailVC from Storyboard
         let detailViewController = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
         //Populate view controller with data from the selected item
         detailViewController.meme = getMeme(indexPath: indexPath)
         // Present the view controller using navigation
         navigationController!.pushViewController(detailViewController, animated: true)
     }
     func getMeme(indexPath: IndexPath) -> Meme {
         return memes[(indexPath as NSIndexPath).row]
     }
 }


