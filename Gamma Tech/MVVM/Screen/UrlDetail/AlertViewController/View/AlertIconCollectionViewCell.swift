//
//  AlertIconCollectionViewCell.swift
//  WebView
//
//  Created by Macbook Pro on 08/03/2023.
//

import UIKit



class AlertIconCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AlertIconCollectionViewCell"
    static let NibName = UINib(nibName: "AlertIconCollectionViewCell", bundle: nil)
    
    @IBOutlet weak var iconImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
