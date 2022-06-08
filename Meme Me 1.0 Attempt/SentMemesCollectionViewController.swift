//
//  SentMemesCollectionViewController.swift
//  Meme Me 1.0 Attempt
//
//  Created by Rianne Pada on 5/3/22.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    fileprivate let cellSize = UIScreen.main.bounds.width / 2
    // MARK: Properties
    //from Udacity Lession 8.5 Code for Using a Shared Model
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           return appDelegate.memes
    }
    // MARK: OUtlets
    //from Udacity Lession 8.11 Setting up a Collection View Flow Layout
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    // MARK: View states
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flow = UICollectionViewFlowLayout()
        let space:CGFloat = 3.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
        collectionView.collectionViewLayout = flow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        //from Udacity Lession 8.13 Setting up a Troubleshooting Collection Views
        collectionView!.reloadData()
    }
    // MARK: Set collection data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    // MARK: Set cell view
    //from Udacity Lession 8.8 Setup the Sent Memes Collection View
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCells", for: indexPath) as! MemeCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        // Set the name and image
        cell.image?.image = meme.memedImage
        return cell
    }
    //from Udacity Lession 8.8 Setup the Sent Memes Collection View
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
// with help from Udacity mentor https://knowledge.udacity.com/questions/848663
extension SentMemesCollectionViewController:
    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
