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
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    var delegate: didSeclectImage?
    var index: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        configCollectionView()
    }
    
    func configCollectionView() {
        IconImageCollection.delegate = self
        IconImageCollection.dataSource = self
        IconImageCollection.register( AlertIconCollectionViewCell.NibName, forCellWithReuseIdentifier: AlertIconCollectionViewCell.identifier)
    }
    
    func config() {
        alertView.layer.cornerRadius = 5
        alertView.layer.borderWidth = 2
        alertView.layer.borderColor = CGColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        closeButton.layer.cornerRadius = 5
        closeButton.tintColor = ResourceColor.headerView
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
        self.dismiss(animated: true)
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
        return CGSize(width: collectionView.frame.width / 6, height: collectionView.frame.height / 2)
         }
    
   
    @IBAction func closeALertIconTapButton(_ sender: Any) {
//                guard let delegate = delegate else {
//                    return
//                }
//        delegate.didSeclectImage(image: imageModel[index ?? 0].noName ?? UIImage())
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
