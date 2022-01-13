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
    @IBOutlet weak var dailySalesLabel: KernLabel!
    @IBOutlet weak var rangeDateButton: KernButton!
    @IBOutlet weak var sumPerMonth: KernLabel!
    @IBOutlet weak var monthlyStatementTableView: UITableView!
    
    //MARK: - Colects Set
    private let UsersStatisticsId = String(describing: UsersStatisticCollecttionCell.self)
    var statisticArray = UsersStatistic.getDemoArrayUserStatistics()
    
    private let columnMiniChartId = String(describing: ColumnMiniChartCell.self)
    var yearlyStatisticsArray = YearlyStatistics.getDemoArrayYearlyStatistics()
    
    //MARK: - Table set
    private let tabCellId = "TableViewCell"
    var contentCellAray = [DataStructure]()
    
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
        
        
        
        
        // Init data
        for item in 1...31 {
            let data = DataStructure()
            
            //format mounth
            let formNumWithZero = String(format: "%02d", item)
            
            data?.month =  formNumWithZero
            data?.dollars = Int.random(in: 0..<5111)
            contentCellAray.append(data!)
            
        }
        monthlyStatementTableView.reloadData()
        
        
        //SummDollars
        let dollarString = contentCellAray.map({$0.dollars})
        let dollarStringOpt = (dollarString.compactMap({$0}))
        let summDoll = dollarStringOpt.reduce(0, +)
        let numberForDollar = summDoll
        let numbForm = NumberFormatter()
        numbForm.numberStyle = .decimal
        let formNumWithCommas = numbForm.string(from: NSNumber(value: numberForDollar))
        sumPerMonth.text = "$\(formNumWithCommas!)"
        
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
        //Delegate
        
    }
}

//MARK: - Extensions for Tables
extension SecondViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentCellAray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tabCellId, for: indexPath) as! TableViewCell
       
        
        
        
        let numberForDollar = contentCellAray[indexPath.row].dollars!
        let numbForm = NumberFormatter()
        numbForm.numberStyle = .decimal
        let formNumWithCommas = numbForm.string(from: NSNumber(value: numberForDollar))
        
        cell.dollarL.text = "$\(formNumWithCommas!)"
        cell.mounthL.text = "January \(contentCellAray[indexPath.row].month!)"
       
        
        //Work with Reusable cell
        cell.indexPath = indexPath
        cell.contentCellAray = contentCellAray
        cell.drawLinesAtPrepareForReuse()
        
        return cell
    }
    
    
}


