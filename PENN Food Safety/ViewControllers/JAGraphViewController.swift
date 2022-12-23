//
//  JAGraphViewController.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 09/11/22.
//

import UIKit
import Highcharts

class JAGraphViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var toDateTextField: UITextField!
    @IBOutlet weak var fromDateTextField: UITextField!
    @IBOutlet weak var customStackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var customStackView: UIStackView!
    @IBOutlet weak var airTempLabel: UILabel!
    @IBOutlet weak var oneDayButton: JACustomButton!
    @IBOutlet weak var oneWeekButton: JACustomButton!
    @IBOutlet weak var oneMonthButton: JACustomButton!
    @IBOutlet weak var threeMonthButton: JACustomButton!
    @IBOutlet weak var customeButton: JACustomButton!
    var model : CabinetViewModel?
    let currentDate = Date()
    var dateFormatter = DateFormatter()
    
    var sources: [[String:Any]]!
    var data: [Any]!
    var dataName: String!
    var charts: [HIChartView]!
    
    var graphViewModels = [GraphViewModel]()
    
    @IBOutlet weak var chartView: HIChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataName = "day"
        self.loadSourcesAndData()
        self.fromDateTextField.setDatePickerAsInputViewFor(target: self, selector: #selector(doneButtonTapped)) //1
        self.toDateTextField.setDatePickerAsInputViewFor(target: self, selector: #selector(doneButtonTapped)) //1
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitle(model?.cabinetDescription ?? "")
        self.updateMenuButton(type: .back)
    }
    
    private var resetColor:UIColor {
        UIColor.lightGray
        
    }
    private var highlightedColor:UIColor {
        UIColor.link
    }
    
    
    private func resetBackgroundColor() {
        customStackView.isHidden = true
        self.oneDayButton.backgroundColor = resetColor
        self.oneWeekButton.backgroundColor = resetColor
        self.oneMonthButton.backgroundColor = resetColor
        self.threeMonthButton.backgroundColor = resetColor
        self.customeButton.backgroundColor = resetColor
    }
    
    @IBAction func actionDateCollection(_ sender: UIButton) {
        self.resetBackgroundColor()
        
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
            
        case 900:
            let updateYesterdayDate = currentDate.addOrSubtructDay(day: -1)
            configureGraphData(fDate: updateYesterdayDate.toString(dateFormat: "EE dd MMM YYYY 00:00:00"))
            
            self.oneDayButton.backgroundColor =  highlightedColor
            
        case 901:
            let updateOneWeekDate = currentDate.addOrSubtructDay(day: -7)
            configureGraphData(fDate: updateOneWeekDate.toString(dateFormat: "EE dd MMM YYYY 00:00:00"))
            
            self.oneWeekButton.backgroundColor =  highlightedColor
        case 902:
            let updateOneMonthDate = currentDate.addOrSubtractMonth(month: -1)
            configureGraphData(fDate: updateOneMonthDate.toString(dateFormat: "EE dd MMM YYYY 00:00:00"))
            
            
            self.oneMonthButton.backgroundColor =  highlightedColor
        case 903:
            let updateThreeMonthDate = currentDate.addOrSubtractMonth(month: -3)
            configureGraphData(fDate: updateThreeMonthDate.toString(dateFormat: "EE dd MMM YYYY 00:00:00"))
            
            threeMonthButton.backgroundColor =  highlightedColor
        case 904:
            self.customeButton.backgroundColor =  highlightedColor
            let updateThreeMonthDate = currentDate.addOrSubtractMonth(month: -3)
            customStackView.isHidden = false
            configureGraphData(fDate: updateThreeMonthDate.toString(dateFormat: "EE dd MMM YYYY 00:00:00"))
        default:
            print("nothing")
            return
        }
    }
    
    private func configureGraphData(fDate: String) {
        
        LoadingView.show()
        let request = AlarmAPI()
        let apiLoader = APILoader(apiHandler: request)
        
        apiLoader.callGraphApi(siteId:  String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int), unitID: (model?.unitID)!, fromDate: fDate, todate: currentDate.toString(dateFormat: "EE dd MMM YYYY HH:mm:ss")){ (result) in
            
            self.graphViewModels = (result.datas?.unitGraphValues?.objects?.map({GraphViewModel(graphModel: $0)}))!
            self.loadSourcesAndData()
            
        }
    }
    
    
    private func loadSourcesAndData() {
        
        var customeView: HIChartView?
        DispatchQueue.main.async {
            LoadingView.hide()
            let xAxis = self.graphViewModels.map({$0.graphTimeStamp!})
            let yAxis = self.graphViewModels.map(({$0.graphReadings!}))
            let yAxisSorted = yAxis.sorted(by: >)
            let xAxisSorted = xAxis.sorted()
            print(xAxisSorted)
            
            if customeView == nil {
                customeView = HIChartView(frame: CGRect(x: 10.0, y: self.airTempLabel.frame.minY + self.airTempLabel.frame.size.height + 20, width: (self.view.bounds.size.width - 20), height: self.view.bounds.size.height - 300))
                
            }
            customeView?.backgroundColor =  .clear
            self.view.addSubview(customeView ?? HIChartView())
            customeView?.options =  GraphHelper.helper.plotGraph(graphType: .spline, xAxis: xAxisSorted, yAxis: [], series:yAxisSorted, toolTipName: (self.model?.resultSensorDescription)!)
            
        }
        
    }
    
    @objc func doneButtonTapped() {
        
        if fromDateTextField.isFirstResponder {
            if let datePicker = self.fromDateTextField.inputView as? UIDatePicker { // 2-1
                dateFormatter.dateStyle = .medium
                dateFormatter.dateFormat = "MM-dd-yyyy"
                fromDateTextField.text = dateFormatter.string(from: datePicker.date)
            }
            
        }
        
        if toDateTextField.isFirstResponder {
            if let datePicker = self.toDateTextField.inputView as? UIDatePicker { // 2-1
                dateFormatter.dateStyle = .medium
                dateFormatter.dateFormat = "MM-dd-yyyy"
                toDateTextField.text = dateFormatter.string(from: datePicker.date)
            }
            
        }
        
        self.view.endEditing(true)
    }
    func createDateTime(timestamp: String) -> String {
        
        var strDate = "undefined"
        
        if let unixTime = Double(timestamp) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
            strDate = dateFormatter.string(from: date)
        }
        return strDate
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}



