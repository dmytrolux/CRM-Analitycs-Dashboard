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
    
    private let totUsSecContID = "UserTotalSVCCVCell"
    var collectTUser : TotalUserClass = TotalUserClass()
    
    private let yearPerSecContID = "VertDiagrameCell"
    var collectYUser : VertDiagClass = VertDiagClass()
    
    //MARK: - Table set
    private let tabCellId = "TableViewCell"
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
        
        
        let numberForDollar = summDoll
        let numbForm = NumberFormatter()
        numbForm.numberStyle = .decimal
        let formNumWithCommas = numbForm.string(from: NSNumber(value: numberForDollar))
        sumDollar.text = "$\(formNumWithCommas!)"
        
        
//        sumDollar.text = String(formNumWithCommas)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "2segue3" {
//            let vc = segue.destination as! ThirdViewController
//            vc.testDouble = 154.0
//        }
//    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == totalUserCV{
            let cell = totalUserCV.dequeueReusableCell(withReuseIdentifier: totUsSecContID, for: indexPath) as! UserTotalSVCCVCell
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
            vc.modalPresentationStyle = .fullScreen
            vc.testInt = cell.countLessUser.text!
            self.present(vc, animated: true) {
                print("Something")
            }
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
        
//        //Formating value for label dollarL
        let numberForDollar = contentCellAray[indexPath.row].dollars!
        let numbForm = NumberFormatter()
        numbForm.numberStyle = .decimal
        let formNumWithCommas = numbForm.string(from: NSNumber(value: numberForDollar))
       
        cell.dollarL.text = "$\(formNumWithCommas!)"
        cell.mounthL.text = "January \(contentCellAray[indexPath.row].month!)"
        
        guard indexPath.row == 2  else {return cell }
        cell.areaForShapes.isHidden = true
        //вимкнути reusable
        return cell
    }
    
    
}

