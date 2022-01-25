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
    @IBOutlet weak var rangeYearForCollection: KernButton!
    @IBOutlet weak var typeChartButton: KernButton!
    @IBOutlet weak var rangingChartCollectionView: UICollectionView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - Data for deteilTotalUserView
    var data: UsersStatistic?
    
    //MARK: - Data for rangingChartCollectionView
    private let columnMiniChartId = String(describing: RangingChartCollectionCell.self)
    var yearlyObjectsArray = YearlyStatistics.getDemoArrayYearlyStatistics()
    
    //MARK: - Data for PickerView
    var yearsIntArray: [Int] { yearlyObjectsArray.map({$0.year}) }
    var allYearsArray: [String] { yearsIntArray.compactMap({String($0)}) }
    //["2003", "2004", "2005", "2006", "2007"...]
    var selectedPickerRow1 = 0
    var selectedPickerRow2 = 18
    var differenceIndex = 0
    var leftPickerArray: [String] { Array(allYearsArray[...(selectedPickerRow2)]) }
    var rightPickerArray: [String] { Array(allYearsArray[(selectedPickerRow1)...]) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Data for deteilTotalUserView
        guard let data = data else { return }
        deteilTotalUserView.setupView(data: data)
        
        //MARK: - Data for rangingChartCollectionView
        self.rangingChartCollectionView.register(UINib(nibName: columnMiniChartId, bundle: nil), forCellWithReuseIdentifier: columnMiniChartId)
        self.rangingChartCollectionView.dataSource = self
        self.rangingChartCollectionView.delegate = self
        
        //MARK: - Data for PickerView
        pickerView.dataSource = self
        pickerView.delegate = self
    }
   
    @IBAction func pressedBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func pressedTypeChart(_ sender: UIButton) {
        print("You pressed to Type Chart")
    }
    
    @IBAction func selectMonthAction() {
        pickerView.isHidden.toggle()
    }
}

//MARK: - Extensions for Collections
extension ThirdViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        yearlyObjectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = rangingChartCollectionView.dequeueReusableCell(withReuseIdentifier: columnMiniChartId, for: indexPath) as! RangingChartCollectionCell
        let userData = yearlyObjectsArray[indexPath.item]
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
            return leftPickerArray.count
        } else {
            return rightPickerArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        pickerView.backgroundColor = MyColor.background
        pickerView.layer.opacity = 0.9
        pickerView.alpha = 0.9
        pickerView.layer.shadowColor = UIColor.white.cgColor
        pickerView.layer.shadowOffset = CGSize(width: 3, height: 10)
        pickerView.layer.shadowOpacity = 0.5
        pickerView.layer.shadowRadius = 9
        
        let pickerViewLabel = UILabel()
        pickerViewLabel.layer.borderWidth = 1
        pickerViewLabel.layer.opacity = 1
        pickerViewLabel.layer.backgroundColor = MyColor.backView?.cgColor
        pickerViewLabel.layer.cornerRadius = 8
        pickerViewLabel.layer.frame = CGRect(x: 0, y: 0, width: 175, height: 30)
        pickerViewLabel.textColor = UIColor.white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "Poppins-Regular", size: CGFloat(20))
        
        if component == 0 {
            pickerViewLabel.text = "\(leftPickerArray[row])"
            return pickerViewLabel
        } else  {
            pickerViewLabel.text = "\(rightPickerArray[row])"
            return pickerViewLabel
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            selectedPickerRow1 = row
            differenceIndex = row
            pickerView.reloadComponent(1)
        case 1:
            selectedPickerRow2 = row + differenceIndex
            pickerView.reloadComponent(0)
        default: break
        }
    }
}

