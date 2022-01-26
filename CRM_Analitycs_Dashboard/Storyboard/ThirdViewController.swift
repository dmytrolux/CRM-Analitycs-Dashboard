//
//  ThirdViewController.swift
//  CRM_Analitycs_Dashboard
//
//  Created by Пришляк Дмитро on 08.01.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var backTotalUserLabel: KernLabel!
    @IBOutlet weak var deteilTotalUserView: StatisticDetailView!
    @IBOutlet weak var chartUserLabel: KernLabel!
    @IBOutlet weak var rangeButton: KernButton!
    @IBOutlet weak var typeChartButton: KernButton!
    @IBOutlet weak var rangingChartCollectionView: UICollectionView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var informing: InformingView!
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height * 0.25
    var numberInforming: Int?
    
    //MARK: - Data for deteilTotalUserView
    var data: UsersStatistic?
    //MARK: - Data for rangingChartCollectionView
    private let columnMiniChartId = String(describing: RangingChartCollectionCell.self)
    var yearlyArrays = YearlyStatistics.getDemoArrayYearlyStatistics()
    
    //MARK: - Data for PickerView
    var yearsIntArray: [Int] { yearlyArrays.map({$0.year}) }
    var yearsAllArray: [String] { yearsIntArray.compactMap({String($0)}) }
    var selectedRow0 = 0
    var selectedRow1 = 18
    var differenceCountIndex = 0
    var labelsComponent0: [String] { Array(yearsAllArray[...selectedRow1]) }
    var labelsComponent1: [String] { Array(yearsAllArray[selectedRow0...]) }
    var rangeYearlyArrays: [YearlyStatistics] { Array(yearlyArrays[selectedRow0...selectedRow1]) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numberInforming = numberInforming{
            informing.setupNumberInforming(numberInforming)
        }
        
        //MARK: - Data for deteilTotalUserView
        guard let data = data else { return }
        deteilTotalUserView.setupView(data: data)
        
        //MARK: - Data for rangingChartCollectionView
        self.rangingChartCollectionView.register(UINib(nibName: columnMiniChartId, bundle: nil), forCellWithReuseIdentifier: columnMiniChartId)
        self.rangingChartCollectionView.dataSource = self
        self.rangingChartCollectionView.delegate = self
    }
    
    
    @IBAction func pressedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func pressedTypeChart(_ sender: UIButton) {
        print("You pressed to Type Chart")
        rangingChartCollectionView.reloadData()
    }
    
    @IBAction func selectMonthAction() {
        let vc = UIViewController()
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(selectedRow0, inComponent: 0, animated: false)
        pickerView.selectRow(selectedRow1, inComponent: 1, animated: false)
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select range years", message: "", preferredStyle: .actionSheet)
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Select", style: .cancel, handler: { (UIAlertAction) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - Extensions for Collections
extension ThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rangeYearlyArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = rangingChartCollectionView.dequeueReusableCell(withReuseIdentifier: columnMiniChartId, for: indexPath) as! RangingChartCollectionCell
        let userData = rangeYearlyArrays[indexPath.item]
        item.setupItem(data: userData)
        return item
    }
}

//MARK: - Extension for PickerView
extension ThirdViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {2}
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { 30 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return labelsComponent0.count
        } else {
            return labelsComponent1.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        pickerView.backgroundColor = UIColor.clear
        pickerView.layer.shadowColor = MyColor.background?.cgColor
        pickerView.layer.shadowOffset = CGSize(width: 3, height: 10)
        pickerView.layer.shadowOpacity = 0.75
        pickerView.layer.shadowRadius = 9
        
        let pickerViewLabel = UILabel()
        pickerViewLabel.layer.opacity = 1
        pickerViewLabel.layer.backgroundColor = MyColor.blue?.cgColor
        pickerViewLabel.layer.cornerRadius = 8
        pickerViewLabel.layer.frame = CGRect(x: 0, y: 0, width: 175, height: 30)
        pickerViewLabel.textColor = UIColor.white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "Poppins-Regular", size: CGFloat(20))
        
        if component == 0 {
            pickerViewLabel.text = "\(labelsComponent0[row])"
            return pickerViewLabel
        } else  {
            pickerViewLabel.text = "\(labelsComponent1[row])"
            return pickerViewLabel
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            selectedRow0 = row
            differenceCountIndex = row
            pickerView.reloadComponent(1)
        case 1:
            selectedRow1 = row + differenceCountIndex
            pickerView.reloadComponent(0)
        default: break
        }
        
        let titleForRange = "In \(yearsAllArray[selectedRow0]) - \(yearsAllArray[selectedRow1])"
        rangeButton.setTitle(titleForRange, for: .normal)
        rangingChartCollectionView.reloadData()
    }
}

