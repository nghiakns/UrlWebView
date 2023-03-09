//
//  AlertViewController.swift
//  WebView
//
//  Created by Macbook Pro on 08/03/2023.
//

import UIKit

protocol didSeclectImage {
    func didSeclectImage(image: UIImage)
}

struct ImageModel {
    var noName: UIImage?
    
    init(noName: UIImage) {
        self.noName = noName
    }
}

var imageModel: [ImageModel] = [
    ImageModel(noName: UIImage(named: "logo_gmt") ?? UIImage()),
    ImageModel(noName: UIImage(named: "mosaic") ?? UIImage()),
    ImageModel(noName: UIImage(named: "mr_gam") ?? UIImage()),
    ImageModel(noName: UIImage(named: "sche") ?? UIImage()),
    ImageModel(noName: UIImage(named: "touch") ?? UIImage()),
    ImageModel(noName: UIImage(named: "vis") ?? UIImage()),
]

class AlertIconViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var IconImageCollection: UICollectionView!
    var delegate: didSeclectImage?
    var index: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        IconImageCollection.delegate = self
        IconImageCollection.dataSource = self
        IconImageCollection.register( AlertIconCollectionViewCell.NibName, forCellWithReuseIdentifier: AlertIconCollectionViewCell.identifier)
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        self.IconImageCollection.layoutIfNeeded()
//        self.layoutIfNeeded()
//        let contentSize = self.IconImageCollection.collectionViewLayout.collectionViewContentSize
//        return CGSize(width: contentSize.width, height: contentSize.height + 70)
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlertIconCollectionViewCell.identifier, for: indexPath) as? AlertIconCollectionViewCell else {return UICollectionViewCell()}
        cell.iconImage.image = imageModel[indexPath.row].noName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        guard let delegate = delegate else {
            return
        }
        delegate.didSeclectImage(image: imageModel[indexPath.row].noName ?? UIImage())
        self.navigationController?.popViewController(animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width / 5 , height: collectionView.frame.size.height)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

         let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
         layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
         layout.minimumInteritemSpacing = 04
         layout.minimumLineSpacing = 04
         layout.invalidateLayout()
         return CGSize(width: ((self.view.frame.width/2) - 6), height: ((self.view.frame.width / 2) - 6))
         }
    
   
    @IBAction func closeALertIconTapButton(_ sender: Any) {
//                guard let delegate = delegate else {
//                    return
//                }
//        delegate.didSeclectImage(image: imageModel[index ?? 0].noName ?? UIImage())
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
