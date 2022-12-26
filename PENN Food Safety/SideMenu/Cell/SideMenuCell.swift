//
//  SideMenuCell.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit
import SDWebImage
import SVGKit


class SideMenuCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0, green: 0.3445361853, blue: 0.607401669, alpha: 1)
        self.selectedBackgroundView = myCustomSelectionColorView
        self.backgroundColor = .clear
        iconImageView.tintColor = .white
        self.titleLabel.textColor = .white
    }
    
    func setupSlideMenu(model:SideMenuModel) {
        
        if (model.icon!.isStringBase64()) {
            iconImageView.image =  UIImage(named: model.icon!)
            
        } else {
          if let imagData =  model.icon {
            let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: imagData))
            iconImageView.image = mySVGImage.uiImage
            }
        }
        titleLabel.text = model.title
    }
}

