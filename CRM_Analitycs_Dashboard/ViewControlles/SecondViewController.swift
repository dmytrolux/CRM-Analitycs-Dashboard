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
    @IBOutlet weak var selectorMonthPickerView: UIPickerView!
    @IBOutlet weak var dailySalesLabel: KernLabel!
    @IBOutlet weak var selectorMonthButton: KernButton!
    @IBOutlet weak var sumMoneyPerMonth: KernLabel!
    @IBOutlet weak var monthlyStatementTableView: UITableView!
    
    //MARK: - Colects Set
    private let UsersStatisticsId = String(describing: UsersStatisticCollecttionCell.self)
    var statisticArray = UsersStatistic.getDemoArrayUserStatistics()
    
    private let columnMiniChartId = String(describing: ColumnMiniChartCell.self)
    var yearlyStatisticsArray = YearlyStatistics.getDemoArrayYearlyStatistics()
    
    //MARK: - Table set
    var selectedMonthlyMoneyArray = [Int]()
    var selectedMonthName = "0"
    private let tabCellId = "TableViewCell"
    var monthlyStatiticsArray = MonthlyStatistic.getDemoArrayMonthlyStatistics()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //tableView.rowHeight = UITableViewAutomaticDimension
        monthlyStatementTableView.separatorColor = UIColor.clear
        self.monthlyStatementTableView.dataSource = self
        self.monthlyStatementTableView.delegate = self
        
        monthlyStatementTableView.reloadData()
    }
    
    @IBAction func selectMonthAction() {
        
        selectorMonthPickerView.isHidden.toggle()
        selectorMonthPickerView.delegate = self
        selectorMonthPickerView.dataSource = self
        monthlyStatementTableView.reloadData()
        
        //add design PickerView
        //add display table before selection
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
            let cell = usersStatisticCollectionView.dequeueReusableCell(withReuseIdentifier: UsersStatisticsId, for: indexPath) as! UsersStatisticCollecttionCell
            let userData = statisticArray[indexPath.item]
            cell.setupCell(totalUser: userData)
            
            return cell
        }
        else {
            let cell = columnMiniChartCollectionView.dequeueReusableCell(withReuseIdentifier: columnMiniChartId, for: indexPath) as! ColumnMiniChartCell
            let userData = yearlyStatisticsArray[indexPath.item]
            cell.setupCell(data: userData)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
        vc.modalPresentationStyle = .fullScreen
        vc.data = statisticArray[indexPath.item]
        self.present(vc, animated: true) {}
    }
}

//MARK: - Extension for PickerView
extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        monthlyStatiticsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedMonthName = monthlyStatiticsArray.map({$0.monthName})[row]
        
        return "\(selectedMonthName)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        selectedMonthlyMoneyArray = monthlyStatiticsArray.map({$0.monthlyMoneyArray})[row]
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
        print(selectedMonthName)
        let monthName = selectedMonthName.capitalized
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
        
        //Reusable cell
        cell.indexPath = indexPath
        cell.selectedMonthlyMoneyArray = selectedMonthlyMoneyArray
        cell.drawLinesAtPrepareForReuse()
        //add reusable for text
        
        return cell
    }
}


