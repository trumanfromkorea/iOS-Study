//
//  CalendarViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/10.
//

import FSCalendar
import UIKit

class CalendarViewController: UIViewController {
    static let identifier = "CalendarViewController"
    static let storyboard = "CalendarView"

    let dateFormatter = DateFormatter()

    var dateList: [String: DateInfo] = [:]

    @IBOutlet var calendarView: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.delegate = self
        calendarView.dataSource = self
        
        dummyData()
        configureStates()
    }

    private func dummyData() {
        let basicDate = "2022-06-"

        for i in 1 ... 30 {
            let dateString = basicDate + (i < 10 ? "0\(i)" : "\(i)")

            dateList[dateString] = DateInfo(dateString: dateString, studyTime: Double.random(in: 1 ... 600))
        }
    }

    private func configureStates() {
        dateFormatter.dateFormat = "yyyy-MM-dd"

        calendarView.scrollDirection = .vertical

        calendarView.appearance.borderRadius = 0
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let dateString = dateFormatter.string(from: date)
        var alpha: CGFloat = 0

        if let dateInfo = dateList[dateString] {
            
            let divided = CGFloat(dateInfo.studyTime / 600.0)
            
            print(divided)
            
            if divided <= 0.25 {
                alpha = 0.25
            } else if divided <= 0.5 {
                alpha = 0.5
            } else if divided <= 0.75 {
                alpha = 0.75
            } else {
                alpha = 1
            }
            
            return Theme.mainColor.withAlphaComponent(alpha)
        } else {
            return nil
        }
    }
    
}
