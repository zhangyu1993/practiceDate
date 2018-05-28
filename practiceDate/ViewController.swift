//
//  ViewController.swift
//  practiceDate
//
//  Created by zhangyu on 2018/5/25.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        DBLog(currentDate)
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        DBLog(dateFormatter.string(from: currentDate))
        let cal = Calendar.current
        
        let com = cal.dateComponents([Calendar.Component.era, Calendar.Component.year,Calendar.Component.month, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second], from: currentDate)
        DBLog(com)
        let tyDate = dateFormatter.date(from: "\(com.year ?? 0)" + "-01-01 00:00:00") ?? Date()
        DBLog(tyDate)
        DBLog(tyDate.timeIntervalSince1970)
        DBLog(dateFormatter.string(from: tyDate))
        
        let dft = DateFormatter()
        dft.dateFormat = "yyyy-MM-dd"
        let currentYearFirstDayInt = dft.date(from: "\(com.year ?? 0)-01-01")?.timeIntervalSince1970 ?? Double.greatestFiniteMagnitude  //当前年份第一天timeint
        let currentYearLastDayInt = dft.date(from: "\(com.year ?? 0)-12-31")?.timeIntervalSince1970 ?? Double.greatestFiniteMagnitude  //当前年份最后一天timeint
        DBLog(currentYearFirstDayInt)
        DBLog(currentYearLastDayInt)
        
        var dateCom = DateComponents()
        dateCom.day = 7
        let addDate = cal.date(byAdding: dateCom, to: Date())
        DBLog(addDate!)
        
        let dateComFom = DateComponentsFormatter()
        dateComFom.unitsStyle = .full
        let str = dateComFom.string(from: addDate!.timeIntervalSince(Date()))
        DBLog(str!)
        
        //未来时间
        let d1 = "2018-05-28 10:30:00"
        let d11 = "2018-05-28 23:59:59"
        
        let d2 = "2018-05-29 00:00:00"
        let d21 = "2018-05-29 10:00:00"
        let d22 = "2018-05-29 23:59:59"
        
        
        let d3 = "2018-05-30 00:00:00"
        let d31 = "2018-05-30 10:00:00"
        let d32 = "2018-05-30 23:59:59"
        let d33 = "2018-12-31 23:59:59"
        
        let d4 = "2019-01-01 00:00:00"
        let d41 = "2019-01-01 10:00:00"
    
        //过去时间
        let d5 = "2018-05-28 10:05:00"
        let d6 = "2018-05-28 09:59:00"
        let d7 = "2018-05-27 11:00:00"
        let d8 = "2018-05-22 11:00:00"
        let d9 = "2018-05-20 11:00:00"
        let d91 = "2018-01-01 00:00:00"
        let d99 = "2017-12-31 23:59:59"
        
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d1)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d11)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d2)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d21)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d22)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d3)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d31)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d32)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d33)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d4)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d41)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d5)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d6)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d7)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d8)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d9)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d91)!.timeIntervalSince1970))
        DBLog(Date.customDateStr(dateSeconds: dateFormatter.date(from: d99)!.timeIntervalSince1970))
        
        
    }
    
   
    
    public func DBLog(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let time = formatter.string(from: Date())
        let array = file.components(separatedBy: "/");
        print("\(time) [\(String(describing: array.last!))] [\(function)] [Line \(line)]", items);
        #endif
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension Date {
    
    static func yyyy(from date: Date?) -> String {
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "yyyy"
            return dft.string(from: date! as Date)
        } else {
            return ""
        }
    }
    
    static func yyyyMMdd(from date: Date?) -> String {
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "yyyy-MM-dd"
            return dft.string(from: date! as Date)
        } else {
            return ""
        }
    }
    
    static func yyyyMM(from date: Date?) -> String {
        if date?.timeIntervalSince1970 == 0 {
            return ""
        }
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "yyyy-MM"
            return dft.string(from: date! as Date)
        } else {
            return ""
        }
    }
    
    static func hhmm(from date: Date?) -> String {
        if date?.timeIntervalSince1970 == 0 {
            return ""
        }
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "a hh:mm"
            return dft.string(from: date!)
        } else {
            return ""
        }
    }
    
    static func mmddhhmmss(from date: Date?) -> String {
        if date?.timeIntervalSince1970 == 0 {
            return ""
        }
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "MM-dd HH:mm"
            return dft.string(from: date!)
        } else {
            return ""
        }
    }
    
    static func yyddhhmmss(from date: Date?) -> String {
        if date?.timeIntervalSince1970 == 0 {
            return ""
        }
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "yyyy-MM-dd HH:mm"
            return dft.string(from: date!)
        } else {
            return ""
        }
    }
    
    
    
    static func HHmm(from date: Date?) -> String {
        if date?.timeIntervalSince1970 == 0 {
            return ""
        }
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "HH:mm"
            return dft.string(from: date!)
        } else {
            return ""
        }
    }
    
    static func MMdd(from date: Date?) -> String {
        if date?.timeIntervalSince1970 == 0 {
            return ""
        }
        if let _ = date {
            let dft = DateFormatter()
            dft.dateFormat = "MM-dd"
            return dft.string(from: date!)
        } else {
            return ""
        }
    }
    
    static func customDateStr(dateSeconds: TimeInterval) -> String{
        if dateSeconds <= 0 {
            return ""
        }
        var resultStr = ""
        let dft = DateFormatter()
        dft.dateFormat = "yyyy-MM-dd"
        
        var timeDif = dateSeconds - Date().timeIntervalSince1970 //时间差
        
        let todayDate = dft.date(from: dft.string(from: Date()) ) //今天0点日期date
        let tomorrowDate = todayDate?.addingTimeInterval(24 * 60 * 60) //明天0点日期date
        let tomorrowTimeInt = tomorrowDate?.timeIntervalSince1970 ?? Double.greatestFiniteMagnitude //明天0点timeint
        let afterTomorrowDate = tomorrowDate?.addingTimeInterval(24 * 60 * 60) //后天0点日期date
        let afterTomorrowTimeInt = afterTomorrowDate?.timeIntervalSince1970 ?? Double.greatestFiniteMagnitude //后天0点timeint
        let currentYear = Calendar.current.dateComponents([Calendar.Component.year], from: Date()).year ?? 1970 //当前年份
        let currentYearFirstDayInt = dft.date(from: "\(currentYear)-01-01")?.timeIntervalSince1970 ?? Double.greatestFiniteMagnitude  //当前年份第一天timeint
        let currentYearLastDayInt = dft.date(from: "\(currentYear + 1)-01-01")?.timeIntervalSince1970 ?? Double.greatestFiniteMagnitude  //当前年份下一年开始时间timeint
        
        
        if timeDif > 0 { //未来时间
            if dateSeconds < tomorrowTimeInt{ // 大于现在时间小于明天0点时间
                resultStr = "今天" + Date.HHmm(from: Date.init(timeIntervalSince1970: dateSeconds))
            }
            else if dateSeconds >= tomorrowTimeInt && dateSeconds < afterTomorrowTimeInt { //大于明天0点小于后天0点
                resultStr = "明天" + Date.HHmm(from: Date.init(timeIntervalSince1970: dateSeconds))
            }
            else if dateSeconds >= currentYearLastDayInt{ //超过今年 显示年份
                resultStr = Date.yyddhhmmss(from: Date.init(timeIntervalSince1970: dateSeconds))
            }
            else {
                resultStr = Date.mmddhhmmss(from: Date.init(timeIntervalSince1970: dateSeconds))
            }
        }
        else{ //过去时间
            timeDif = -timeDif
            
            let timeMin = timeDif / 60
            let timeHour = timeMin / 60
            let timeDay = timeHour / 24
            
            if timeDif < 60 {
                resultStr = "刚刚"
            }
            else if timeMin < 60 {
                resultStr = "\(Int(timeMin))分钟前"
            }
            else if timeHour < 24 {
                resultStr = "\(Int(timeHour))小时前"
            }
            else if timeDay < 7 {
                resultStr = "\(Int(timeDay))天前"
                
            }
            else if dateSeconds < currentYearFirstDayInt{ //在今年第一天之前
                resultStr = Date.yyyyMMdd(from: Date.init(timeIntervalSince1970: dateSeconds))
            }
            else {
                resultStr = Date.MMdd(from: Date.init(timeIntervalSince1970: dateSeconds))
            }
        }
        return resultStr
        
    }
}
