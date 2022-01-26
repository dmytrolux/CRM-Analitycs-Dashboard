//
//  SecondViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var headingNavigationBarLabel: KernLabel!
    @IBOutlet weak var usersStatisticCollectionView: UICollectionView!
    @IBOutlet weak var columnMiniChartCollectionView: UICollectionView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var dailySalesLabel: KernLabel!
    @IBOutlet weak var monthlyRangeButton: KernButton!
    @IBOutlet weak var sumMoneyPerMonth: KernLabel!
    @IBOutlet weak var monthlyStatementTableView: UITableView!
    @IBOutlet weak var viewInform: InformingView!
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height * 0.2
    
    var numberInforming = 0
    
    //MARK: - Colects Set
    private let UsersStatisticsId = String(describing: UsersStatisticCollecttionCell.self)
    var statisticArray = UsersStatistic.getDemoArrayUserStatistics()
    
    private let columnMiniChartId = String(describing: ColumnMiniChartCell.self)
    var yearlyStatisticsArray = YearlyStatistics.getDemoArrayYearlyStatistics()
    
    //MARK: - Table set
    private let tabCellId = "TableViewCell"
    var selectedNameMonth = "january"
    var selectedRowMonth = 0
    var monthlyArrays = MonthlyStatistic.getDemoArrayMonthlyStatistics()
    var selectedMonthlyMoneyArray: [Int] { monthlyArrays.map({$0.monthlyMoneyArray})[selectedRowMonth] }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        increaseNumberInforming()
        viewInform.setupNumberInforming(numberInforming)
        
        // Register cell of first collection
        self.usersStatisticCollectionView.register(UINib(nibName: UsersStatisticsId, bundle: nil), forCellWithReuseIdentifier: UsersStatisticsId)
        self.usersStatisticCollectionView.dataSource = self
        self.usersStatisticCollectionView.delegate = self
        
        // Register cell of second collection
        self.columnMiniChartCollectionView.register(UINib(nibName: columnMiniChartId, bundle: nil), forCellWithReuseIdentifier: columnMiniChartId)
        self.columnMiniChartCollectionView.dataSource = self
        self.columnMiniChartCollectionView.delegate = self
        
        // Register cell of table
        monthlyStatementTableView.register(UINib.init(nibName: tabCellId, bundle: nil), forCellReuseIdentifier: tabCellId)
        monthlyStatementTableView.separatorColor = UIColor.clear
        self.monthlyStatementTableView.dataSource = self
        self.monthlyStatementTableView.delegate = self
    }
    
    @IBAction func pressedInforming() {
        if numberInforming > 0 {
            numberInforming -= 1
            viewInform.setupNumberInforming(numberInforming)
        }
    }
    
    @IBAction func pressedPerson() {
        if numberInforming < 9 {
            numberInforming += 1
            viewInform.setupNumberInforming(numberInforming)
        }
    }
    
    @IBAction func selectMonthAction() {
        let vc = UIViewController()
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(selectedRowMonth, inComponent: 0, animated: false)
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select month", message: "", preferredStyle: .actionSheet)
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .cancel, handler: { (UIAlertAction) in }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func increaseNumberInforming(){
        if numberInforming < 9 {
            let delay = Double.random(in: 5...30)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay ) {
                if self.numberInforming < 9 {
                    self.numberInforming += 1
                    self.viewInform.setupNumberInforming(self.numberInforming)
                    self.increaseNumberInforming()
                }
            }
        }
    }
    
}

//MARK: - Extensions for Collections
extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == usersStatisticCollectionView{
            return statisticArray.count
        }
        else {
            return yearlyStatisticsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == usersStatisticCollectionView{
            let item = usersStatisticCollectionView.dequeueReusableCell(withReuseIdentifier: UsersStatisticsId, for: indexPath) as! UsersStatisticCollecttionCell
            let userData = statisticArray[indexPath.item]
            item.setupItem(totalUser: userData)
            
            return item
        }
        else {
            let item = columnMiniChartCollectionView.dequeueReusableCell(withReuseIdentifier: columnMiniChartId, for: indexPath) as! ColumnMiniChartCell
            let userData = yearlyStatisticsArray[indexPath.item]
            item.setupItem(data: userData)
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == usersStatisticCollectionView{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
            vc.modalPresentationStyle = .fullScreen
            vc.data = statisticArray[indexPath.item]
            vc.numberInforming = numberInforming
            self.present(vc, animated: true) {}
        }
    }
}

//MARK: - Extension for PickerView
extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { 35 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        monthlyArrays.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        selectedNameMonth = monthlyArrays.map({$0.monthName})[row]
        
        let pickerViewLabel = UILabel()
        pickerViewLabel.textColor = MyColor.backLine
        pickerViewLabel.backgroundColor = UIColor.white
        pickerViewLabel.layer.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        pickerViewLabel.layer.cornerRadius = 15
        pickerViewLabel.clipsToBounds = true
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.textColor = MyColor.blue
        pickerViewLabel.font = UIFont(name: "Poppins-Regular", size: 25)
        pickerViewLabel.text = selectedNameMonth
        
        monthlyStatementTableView.reloadData()
        return pickerViewLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRowMonth = row
        monthlyStatementTableView.reloadData()
    }
}

//MARK: - Extensions for Tables
extension SecondViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMonthlyMoneyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tabCellId, for: indexPath) as! TableViewCell
        
        //Formatting value money: comma separation and mark dollar
        let numberForDollar = selectedMonthlyMoneyArray[indexPath.row]
        let numbForm = NumberFormatter()
        numbForm.numberStyle = .decimal
        let formNumWithCommas = numbForm.string(from: NSNumber(value: numberForDollar))
        let formattedMoney = "$\(formNumWithCommas!)"
        
        //Formatting value date: two-digit day, capitalized name month, concatenation
        let day = String(format: "%02d", indexPath.row + 1)
        let monthName = selectedNameMonth.capitalized
        let formattedDate = "\(monthName) \(day)"
        
        //Values substitution
        cell.moneyLabel.text = formattedMoney
        cell.dateLabel.text = formattedDate
        
        //Summ Money Label
        let sumMoney = selectedMonthlyMoneyArray.reduce(0, +)
        let sumMoneyFormatter = NumberFormatter()
        sumMoneyFormatter.numberStyle = .decimal
        let sumMoneyComma = sumMoneyFormatter.string(from: NSNumber(value: sumMoney))
        let formattedSumMoney = "$\(sumMoneyComma!)"
        sumMoneyPerMonth.text = formattedSumMoney
        
        //Title Button: set selected range
        let firstRangeDay = "01"
        let lastRangeDay = String(format: "%02d", selectedMonthlyMoneyArray.count)
        let titleSelectorButton = "\(monthName) \(firstRangeDay) - \(lastRangeDay)"
        monthlyRangeButton.setTitle(titleSelectorButton, for: .normal)
        
        //Reusable cell
        cell.indexPath = indexPath
        cell.selectedMonthlyMoneyArray = selectedMonthlyMoneyArray
        cell.drawLinesAtPrepareForReuse()
        
        return cell
    }
}


