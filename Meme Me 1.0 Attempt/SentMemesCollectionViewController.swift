//
//  SentMemesCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by 🍑 on 09/10/2019.
//  Copyright © 2019 udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    // MARK: Properties
    var memes: [Meme]! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    // MARK: OUtlets
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    // MARK: View states
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        collectionView.reloadData()
    }
    // MARK: Set collection data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    class SentMemesCollectionViewCells: UICollectionViewCell {
          @IBOutlet weak var memeImage: UIImageView!
    }
    
    // MARK: Set cell view
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCells", for: indexPath) as! SentMemesCollectionViewCells
        let meme = self.memes[(indexPath as NSIndexPath).row]
        cell.memeImage?.image = meme.memedImage
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = storyboard!.instantiateViewController(withIdentifier: "memeDetailViewController") as! MemeDetailViewController
        detailViewController.meme = getMeme(indexPath: indexPath)
    
        navigationController!.pushViewController(detailViewController, animated: true)
    }
    func getMeme(indexPath: IndexPath) -> Meme {
        return memes[(indexPath as NSIndexPath).row]
    }
}
