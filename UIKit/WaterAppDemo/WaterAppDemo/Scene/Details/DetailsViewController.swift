//
//  DetailsViewController.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/10.
//

import Charts
import SnapKit
import UIKit

class DetailsViewController: UIViewController {
    let radarChart = RadarChartView()

    let redDataSet = RadarChartDataSet(
        entries: [
            RadarChartDataEntry(value: 120.0),
            RadarChartDataEntry(value: 160.0),
            RadarChartDataEntry(value: 110.0),
            RadarChartDataEntry(value: 110.0),
            RadarChartDataEntry(value: 210.0),
            RadarChartDataEntry(value: 120.0),
        ]
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewSettings()
        configureChart()
        configureLayout()
    }
}

// MARK: - Initial Settings

extension DetailsViewController {
    private func configureViewSettings() {
        title = "상세 정보"
        view.backgroundColor = .systemBackground
    }

    private func configureLayout() {
        view.addSubview(radarChart)
        radarChart.translatesAutoresizingMaskIntoConstraints = false

        radarChart.snp.makeConstraints { make in
            make.width.height.equalTo(self.view)
        }
    }

    private func configureChart() {
        let data = RadarChartData(dataSets: [redDataSet])
        radarChart.data = data
        radarChart.highlightPerTapEnabled = false

        // 1
        redDataSet.lineWidth = 2

        // 2
        let redColor = UIColor(red: 247 / 255, green: 67 / 255, blue: 115 / 255, alpha: 1)
        let redFillColor = UIColor(red: 247 / 255, green: 67 / 255, blue: 115 / 255, alpha: 0.6)
        redDataSet.colors = [redColor]
        redDataSet.fillColor = redFillColor
        redDataSet.drawFilledEnabled = true

        // 3
        redDataSet.valueFormatter = DataSetValueFormatter()

        // 2
        radarChart.webLineWidth = 1.5
        radarChart.innerWebLineWidth = 1.5
        radarChart.webColor = .lightGray
        radarChart.innerWebColor = .lightGray

        // 3
        let xAxis = radarChart.xAxis
        xAxis.labelFont = .systemFont(ofSize: 9, weight: .bold)
        xAxis.labelTextColor = .black
        xAxis.xOffset = 10
        xAxis.yOffset = 10
        xAxis.valueFormatter = XAxisFormatter()

        // 4
        let yAxis = radarChart.yAxis
        yAxis.labelFont = .systemFont(ofSize: 9, weight: .light)
        yAxis.labelCount = 6
        yAxis.drawTopYLabelEntryEnabled = false
        yAxis.axisMinimum = 0
        yAxis.valueFormatter = YAxisFormatter()

        // 5
        radarChart.rotationEnabled = false
        radarChart.legend.enabled = false
    }
}
