//
//  WeeklyViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/10.
//

import Charts
import UIKit

class WeeklyViewController: UIViewController {
    static let identifier = "WeeklyViewController"
    static let storyboard = "WeeklyView"

    @IBOutlet var barChartView: BarChartView!

    var weekdays: [String]!
    var minuteValues: [Double]!

    override func viewDidLoad() {
        super.viewDidLoad()

        weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        minuteValues = [147.0, 294.0, 465.0, 38.0, 338.0, 170.0, 113.0]

        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray

        setChart(dataPoints: weekdays, values: minuteValues)
    }

    func setChart(dataPoints: [String], values: [Double]) {
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0 ..< dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "분")

        // 차트 컬러
        chartDataSet.colors = [Theme.mainColor]

        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        chartData.barWidth = Double(0.65)

        // 선택 안되게
//        chartDataSet.highlightEnabled = false
        // 줌 안되게
        barChartView.doubleTapToZoomEnabled = false

        barChartView.xAxis.drawGridLinesEnabled = false

        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: weekdays)

        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)

        // 오른쪽 레이블 제거
        barChartView.rightAxis.enabled = false

        // 기본 애니메이션
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
    }
}
