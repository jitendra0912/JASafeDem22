//
//  RefrigerationCollectionViewCell.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 13/09/22.
//

import UIKit
import SVGKit

class RefrigerationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var refrigerationImageView: UIImageView!
    @IBOutlet weak var refrigerationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with refrigerationData: Refrigeration) {
        refrigerationImageView.image = refrigerationData.image
        refrigerationLabel.text = refrigerationData.title
    }

}

class RefrigerationCellDynamic: UICollectionViewCell {
    @IBOutlet weak var refrigerationImageView: UIImageView!
    @IBOutlet weak var refrigerationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with refrigerationData: SideMenuModel) {
       // refrigerationImageView.image = refrigerationData.icon
        
        if let imagData =  refrigerationData.icon {
          let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: imagData))
            refrigerationImageView.image = mySVGImage.uiImage
          }
        
        
        refrigerationLabel.text = refrigerationData.title
    }
}
