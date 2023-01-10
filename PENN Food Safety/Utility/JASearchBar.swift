//
//  JASearchBar.swift
//  Demo2
//
//  Created by Varun Shukla on 14/10/22.
//

import UIKit
import SwiftUI
protocol JASearchBarDelegate: AnyObject {
   
    func JASearchBarTextDidChange(_ searchBar: UISearchBar, textDidChange searchText: String)
    func JASearchBarSearchButtonClicked(_ searchBar: UISearchBar)
    func JAsearchBarCancelButtonClicked(_ searchBar: UISearchBar)
    
}

class JASearchBar: UIView {

   private var searchBar:UISearchBar = UISearchBar()
    weak var delegate: JASearchBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSearchBar()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupSearchBar()
    }
    
    func setup() {
        self.backgroundColor =  UIColor .blue
    }
    public var placeHolder = "Search" {
        didSet {
            self.searchBar.placeholder = placeHolder
        }
    }
    
    public var searchTextColor = UIColor.clear {
        didSet {
            self.searchBar.searchTextField.backgroundColor = searchTextColor
        }
    }
    func setupSearchBar() {
        searchBar.frame = self.bounds
        searchBar.placeholder =  placeHolder
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.sizeToFit()
        searchBar.clipsToBounds = true
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.searchTextField.backgroundColor = searchTextColor
        self.searchBar.searchTextField.delegate = self
        self.searchBar.delegate =  self
        self.addSubview(searchBar)
        
    }

}
extension JASearchBar : UISearchBarDelegate, UITextFieldDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.delegate?.JASearchBarTextDidChange(searchBar, textDidChange: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.delegate?.JASearchBarSearchButtonClicked(searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.delegate?.JASearchBarSearchButtonClicked(searchBar)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      //  self.searchBar.searchTextField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard range.location == 0 else {
            return true
        }

        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
        return newString.rangeOfCharacter(from: CharacterSet.whitespacesAndNewlines).location != 0
    }
}


struct SearchViewSwiftUI:UIViewRepresentable {
    
    typealias UIViewType = JASearchBar
    
    func makeUIView(context: Context) -> JASearchBar {
        let searchView =  JASearchBar()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }
    
    func updateUIView(_ uiView: JASearchBar, context: Context) {
        uiView.searchTextColor =  UIColor.lightGray
        uiView.layer.cornerRadius = 16
    }
    
   
    
    
}
