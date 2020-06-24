//
//  HeadlinesCollectionViewController.swift
//  E-News
//
//  Created by Esha Shetty on 2020-06-23.
//  Copyright © 2020 Esha Shetty. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HeadlinesCollectionViewController: UICollectionViewController {

    var itemSize: CGSize = CGSize(width: 0, height: 0)

    var articles = [ArticleDetail] (){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading data from the API
        let articleRequest = NewsRequest()
        articleRequest.getArticles{[weak self] result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let narticles):
                self?.articles = narticles
            }
        }
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            
            let itemsPerRow: CGFloat = 2
            let padding: CGFloat = 5
            let totalPadding: CGFloat = padding * (itemsPerRow - 1)
            let individualPadding: CGFloat = totalPadding / itemsPerRow
            let width = collectionView.frame.width / itemsPerRow - individualPadding
            let height = width * 1.25
            layout.minimumLineSpacing = padding
            layout.minimumInteritemSpacing = 0
            layout.estimatedItemSize = itemSize
            itemSize = CGSize(width: width, height: height)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return itemSize
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        if let c = cell as? NewsCollectionViewCell{
            
            c.title.text = articles[indexPath.row].title
            c.source.text = articles[indexPath.row].source.name
        }
        return cell
    }
}
