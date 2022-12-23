//
//  RemarkViewController.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 15/11/22.
//

import UIKit

class RemarkViewController: BaseViewController {

    @IBOutlet weak var textViewRemark: UITextView!
    
    var _alrmModel: AlarmViewModel?
    var correctActionTitle: String?
    var reasonTitle: String?
    var alermModel = FSHelper.share.alertDataM

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewRemark.layer.cornerRadius = 8.0
        self.setNavigationTitle("Remark's")
        self.updateMenuButton(type: .back)
//        alermModel?.actionText = correctActionTitle

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionFiniesh(_ sender: UIButton) {
               let request = AlarmAPI()
                let apiLoader = APILoader(apiHandler: request)
        
        
        
        alermModel?.remarks  = self.textViewRemark.text
        alermModel?.actionText = correctActionTitle
        alermModel?.reasonText = reasonTitle
//        guard let alermModel = FSHelper.share.alertDataM else {
//
//            return
//        }
        
       
        
        
            apiLoader.postNotificationAPI(model:alermModel!) { response in
        
                   print("response>>>>\(response)")
        
        
              } failure: { error in
                    print("error>>>>\(error)")
                }
                
                
                
                
           }
        
    
}
