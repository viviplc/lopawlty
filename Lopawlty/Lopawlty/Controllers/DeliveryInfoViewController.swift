//
//  DeliveryInfoViewController.swift
//  Lopawlty
//
//  Created by user193926 on 12/1/21.
//

import UIKit

class DeliveryInfoViewController: UIViewController {

    @IBOutlet weak var Day1View: UIView!
    @IBOutlet weak var Day2View: UIView!
    @IBOutlet weak var Day3View: UIView!
    @IBOutlet weak var Day4View: UIView!
    
    @IBOutlet weak var Day1Btn: UIButton!
    @IBOutlet weak var Day2Btn: UIButton!
    @IBOutlet weak var Day3Btn: UIButton!
    @IBOutlet weak var Day4Btn: UIButton!
    
    @IBOutlet weak var Day1DayWeek: UILabel!
    @IBOutlet weak var Day1DayNum: UILabel!
    @IBOutlet weak var Day1Month: UILabel!
    @IBOutlet weak var Day2DayWeek: UILabel!
    @IBOutlet weak var Day2DayNum: UILabel!
    @IBOutlet weak var Day2Month: UILabel!
    @IBOutlet weak var Day3DayWeek: UILabel!
    @IBOutlet weak var Day3DayNum: UILabel!
    @IBOutlet weak var Day3Month: UILabel!
    @IBOutlet weak var Day4DayWeek: UILabel!
    @IBOutlet weak var Day4DayNum: UILabel!
    @IBOutlet weak var Day4Month: UILabel!
        
    @IBOutlet weak var Btn9AM: UIButton!
    @IBOutlet weak var Btn11AM: UIButton!
    @IBOutlet weak var Btn1PM: UIButton!
    @IBOutlet weak var Btn3PM: UIButton!
    
    var saleId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDatesButtonsInfo()
        setHoursButtonsStyles()
    
        
    }
    
    func setDatesButtonsInfo(){
        let calendar = Calendar.current
        let today = Date()
        let midnight = calendar.startOfDay(for: today)
        
        for index in 1...4{
            let nextDay = calendar.date(byAdding: .day, value: index, to: midnight)!
             
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayWeekString = dateFormatter.string(from: nextDay)
            dateFormatter.dateFormat = "d"
            let dayNumString = dateFormatter.string(from: nextDay)
            dateFormatter.dateFormat = "MMM"
            let monthString = dateFormatter.string(from: nextDay)
            
            switch index {
            case 1:
                Day1DayWeek.text = dayWeekString
                Day1DayNum.text = dayNumString
                Day1Month.text = monthString
            case 2:
                Day2DayWeek.text = dayWeekString
                Day2DayNum.text = dayNumString
                Day2Month.text = monthString
            case 3:
                Day3DayWeek.text = dayWeekString
                Day3DayNum.text = dayNumString
                Day3Month.text = monthString
            case 4:
                Day4DayWeek.text = dayWeekString
                Day4DayNum.text = dayNumString
                Day4Month.text = monthString
            default:
                print("Date error")
            }
        }
    }
    
    func setHoursButtonsStyles() {
        Btn9AM.layer.cornerRadius = 15
        Btn9AM.layer.borderWidth = 1
        Btn9AM.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
        Btn11AM.layer.cornerRadius = 15
        Btn11AM.layer.borderWidth = 1
        Btn11AM.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
        Btn1PM.layer.cornerRadius = 15
        Btn1PM.layer.borderWidth = 1
        Btn1PM.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
        Btn3PM.layer.cornerRadius = 15
        Btn3PM.layer.borderWidth = 1
        Btn3PM.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
    }
    
    
    @IBAction func BtnDay1Click(_ sender: Any) {
        resetDayButtons()
        Day1View.layer.backgroundColor = UIColor(red: 1, green:1, blue: 1, alpha: 1).cgColor
        Day1Btn.layer.borderWidth = 3
        Day1Btn.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
    }
    
    @IBAction func BtnDay2Click(_ sender: Any) {
        resetDayButtons()
        Day2View.layer.backgroundColor = UIColor(red: 1, green:1, blue: 1, alpha: 1).cgColor
        Day2Btn.layer.borderWidth = 3
        Day2Btn.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
    }
    
    @IBAction func BtnDay3Click(_ sender: Any) {
        resetDayButtons()
        Day3View.layer.backgroundColor = UIColor(red: 1, green:1, blue: 1, alpha: 1).cgColor
        Day3Btn.layer.borderWidth = 3
        Day3Btn.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
    }
    
    @IBAction func BtnDay4Click(_ sender: Any) {
        resetDayButtons()
        Day4View.layer.backgroundColor = UIColor(red: 1, green:1, blue: 1, alpha: 1).cgColor
        Day4Btn.layer.borderWidth = 3
        Day4Btn.layer.borderColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1).cgColor
    }
    
    func resetDayButtons() {
        Day1View.layer.backgroundColor = UIColor(red: 204/255, green:228/255, blue: 1, alpha: 1).cgColor
        Day1Btn.layer.borderWidth = 0
        Day2View.layer.backgroundColor = UIColor(red: 204/255, green:228/255, blue: 1, alpha: 1).cgColor
        Day2Btn.layer.borderWidth = 0
        Day3View.layer.backgroundColor = UIColor(red: 204/255, green:228/255, blue: 1, alpha: 1).cgColor
        Day3Btn.layer.borderWidth = 0
        Day4View.layer.backgroundColor = UIColor(red: 204/255, green:228/255, blue: 1, alpha: 1).cgColor
        Day4Btn.layer.borderWidth = 0
    }
    
    @IBAction func Btn9AmClick(_ sender: Any) {
        resetHourButtons()
        Btn9AM.layer.borderWidth = 3
    }
    
    @IBAction func Btn11AmClick(_ sender: Any) {
        resetHourButtons()
        Btn11AM.layer.borderWidth = 3
    }
    
    @IBAction func Btn1PmClick(_ sender: Any) {
        resetHourButtons()
        Btn1PM.layer.borderWidth = 3
    }
    
    @IBAction func Btn3PmClick(_ sender: Any) {
        resetHourButtons()
        Btn3PM.layer.borderWidth = 3
    }
    
    func resetHourButtons() {
        Btn9AM.layer.borderWidth = 1
        Btn11AM.layer.borderWidth = 1
        Btn1PM.layer.borderWidth = 1
        Btn3PM.layer.borderWidth = 1
    }
    
}
