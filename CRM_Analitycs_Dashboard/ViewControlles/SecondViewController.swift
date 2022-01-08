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
    @IBOutlet weak var totalUserCV: UICollectionView!
    @IBOutlet weak var yearCV: UICollectionView!
    @IBOutlet weak var dailyL: UILabel!{
        didSet{
            dailyL.attributedText =  NSMutableAttributedString(string: "Daily Sales Results", attributes: [NSAttributedString.Key.kern: 1])
        }
    }
    @IBOutlet weak var choseDate: UILabel!{
        didSet{
            choseDate.font = UIFont(name: "Poppins-Regular", size: 10)
            choseDate.attributedText = NSMutableAttributedString(string: "January 01 - 30", attributes: [NSAttributedString.Key.kern: 0.5])
        }
    }
    @IBOutlet weak var sumDollar: UILabel!{
        didSet{
            sumDollar.font = UIFont(name: "Poppins-Bold", size: 15)
            sumDollar.textAlignment = .right
            sumDollar.attributedText = NSMutableAttributedString(string: "$10,190", attributes: [NSAttributedString.Key.kern: 1.35])
            
            
            //sumDollar.text = "\(summDoll)"
        }
    }
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
        for item in 1...31 {
            let data = DataStructure()
            
            //format mounth
            let formNumWithZero = String(format: "%02d", item)
        
            data?.month =  formNumWithZero
            data?.dollars = Int.random(in: 0..<5111)
            contentCellAray.append(data!)
        
        }
        tableViewTV.reloadData()
        
        
        //SummDollars
        let dollarString = contentCellAray.map({$0.dollars})
        let dollarStringOpt = (dollarString.compactMap({$0}))
        let summDoll = dollarStringOpt.reduce(0, +)
        print(summDoll)
        
        
        
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
        
        //Formating value for label dollarL
        let numberForDollar = Int.random(in: 0..<5111)
        let numbForm = NumberFormatter()
        numbForm.numberStyle = .decimal
        let formNumWithCommas = numbForm.string(from: NSNumber(value: numberForDollar))
        
       cell.dollarL.text = "$\(String(formNumWithCommas!))"
       
        cell.mounthL.text = "January \(contentCell.month!)"
        
        guard indexPath.row == 2  else {return cell }
        cell.areaForShapes.isHidden = true
        //вимкнути reusable
        return cell
    }
    
    
}

