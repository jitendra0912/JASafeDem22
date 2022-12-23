//
//  SideMenuViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import Foundation

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var sideMenuTableView: UITableView!
    @IBOutlet var footerLabel: UILabel!
    var viewControllerClass: AnyClass!
    var model: MenuViewModel?
    var delegate: SideMenuViewControllerDelegate?
    var defaultHighlightedCell: Int = 0
    
    var moduleLogViewModel = [ModuleLogViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callModuleAPI()
        
        let arrMenu = FSHelper.share.loadSlideMenu(forResource: "FSMenu")
        model  = MenuViewModel(arrMenu: arrMenu! as [AnyObject])
        
        
        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.backgroundColor = #colorLiteral(red: 0.002727883635, green: 0.3326534629, blue: 0.5913251638, alpha: 1)
        self.sideMenuTableView.separatorStyle = .none
        
        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }
        
        // Footer
        self.footerLabel.textColor = UIColor.white
        self.footerLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.footerLabel.text = "Johnson Controls"
        
        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
        
        // Update TableView with the data
        //        self.sideMenuTableView.reloadData()
    }
    
    private func callModuleAPI() {
        LoadingView.show()
        let request = ModuleAPI()
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)) { (model, err) in
            if let error = err {
                print(error)
                LoadingView.hide()
            } else {
                if let moduleData = model?.data {
                    self.moduleLogViewModel = (moduleData.moduleList.map({ModuleLogViewModel(moduleModel: $0)}))
                    DispatchQueue.main.async {
                        LoadingView.hide()
                        self.sideMenuTableView.reloadData()
                    }
                }
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1 {
            return 50
        }
        return 50
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let menu  = model?.slideMenu else {
            return 0
        }
        if section == 0 {
            return 1
        } else if section == 1 {
            return moduleLogViewModel.count
        }else{
            return menu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }
               
        if indexPath.section == 0 {
            cell.titleLabel.text = "DashBoard"
            cell.iconImageView.image = UIImage(named: "HomeIcon")
            return cell
        }else if indexPath.section == 1 {
            let cabinetViewModel = self.moduleLogViewModel[indexPath.row]
            cell.moduleLogViewModel =  cabinetViewModel
            return cell
        }else  {
            let obj = (model?.slideMenu[indexPath.row]) as SideMenuModel?
            cell.setupSlideMenu(model: obj!)
            return cell
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        guard let seletedMenuItem =  model?.slideMenu[indexPath.row] else {
            return
        }
        NavigationHelper.helper.openSidePanel(!NavigationHelper.helper.isOpen)
               if let controller =  NSClassFromString(SWIFT_CLASS_STRING(seletedMenuItem.controller) ?? "") {
        
                    if !NavigationHelper.helper.currentViewController!.isKind(of: controller) {
        
                        self.navigateToViewController(FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: controller)))
        
                    }
        
                }
    }
}
extension SideMenuViewController {
    
    private func isControllerPresent(controller: AnyClass)->Bool {
        return  NavigationHelper.helper.contentNavController!.hasViewController(ofKind: controller) ?? false
    }
    
    private func navigateToViewController(_ viewController: UIViewController){
        if (viewController.isKind(of: HomeViewController.self)) {
            
            let dashVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as! HomeViewController
            NavigationHelper.helper.contentNavController!.pushViewController(dashVC, animated: true)
            //   NavigationHelper.helper.contentNavController?.popToRootViewController(animated: true)
        }
        else if (viewController.isKind(of: SyncViewController.self)) {
            let sycVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: SyncViewController.self)) as!SyncViewController
            NavigationHelper.helper.contentNavController!.pushViewController(sycVC, animated: true)
        }
        else if (viewController.isKind(of: NotificationViewController.self)) {
            let notVC = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: String(describing: NotificationViewController.self)) as! NotificationViewController
            NavigationHelper.helper.contentNavController!.pushViewController(notVC, animated: true)
        }
    }
}

