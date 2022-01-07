//
//  SecondViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 05.01.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var dashboardL: UILabel!{
        didSet{
            dashboardL.attributedText =  NSMutableAttributedString(string: "Dashboard", attributes: [NSAttributedString.Key.kern: 2])
        }
    }
    @IBOutlet weak var dailyL: UILabel!{
        didSet{
            dailyL.attributedText =  NSMutableAttributedString(string: "Daily Sales Results", attributes: [NSAttributedString.Key.kern: 1])
        }
    }
    @IBOutlet weak var totalUserCV: UICollectionView!
    @IBOutlet weak var yearCV: UICollectionView!
    @IBOutlet weak var tableViewTV: UITableView!
    
    
    //MARK: - Colects Set
    
    let totUsSecContID = "UserTotalSVCCVCell"
    var collectTUser : TotalUserClass = TotalUserClass()
    
    let yearPerSecContID = "VertDiagrameCell"
    var collectYUser : VertDiagClass = VertDiagClass()
    
    //MARK: - Table set
    let tabCellId = "TableViewCell"
    var contentCellAray = [DataStructure]()
    

    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell of first collection
        self.totalUserCV.register(UINib(nibName: totUsSecContID, bundle: nil), forCellWithReuseIdentifier: totUsSecContID)
        self.totalUserCV.dataSource = self
        self.totalUserCV.delegate = self
        
        // Register cell of second collection
        self.yearCV.register(UINib(nibName: yearPerSecContID, bundle: nil), forCellWithReuseIdentifier: yearPerSecContID)
        self.yearCV.dataSource = self
        self.yearCV.delegate = self
        
        
        // Register cell of table
        tableViewTV.register(UINib.init(nibName: tabCellId, bundle: nil), forCellReuseIdentifier: tabCellId)
        //tableView.rowHeight = UITableViewAutomaticDimension
        tableViewTV.separatorColor = UIColor.clear
        self.tableViewTV.dataSource = self
        self.tableViewTV.delegate = self
        
        // Init data
        for _ in 1...25 {
            let data = DataStructure()
            data?.month = "Junuary 02"
            data?.dollars = "$5,667"
            contentCellAray.append(data!)
        }
        tableViewTV.reloadData()
    }
    
}

//MARK: - Extensions for Collections
extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == totalUserCV{
            return collectTUser.totalUserArray.count
        }
        else {
            return collectYUser.yearUserArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == totalUserCV{
            let cell = totalUserCV.dequeueReusableCell(withReuseIdentifier: totUsSecContID, for: indexPath) as! UserTotalSVCCVCell
            let userData = collectTUser.totalUserArray[indexPath.item]
            cell.setupCell(totalUser: userData)
            return cell
        }
        else {
            let cell = yearCV.dequeueReusableCell(withReuseIdentifier: yearPerSecContID, for: indexPath) as! VertDiagrameCell
            let userData = collectYUser.yearUserArray[indexPath.item]
            cell.setupCell(userOfYear: userData)
            return cell
        }
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
        cell.selectionStyle = .none
        let contentCell = contentCellAray[indexPath.row]
        cell.dollarL.text = contentCell.dollars!
        cell.mounthL.text = contentCell.month!
        return cell
    }
}

