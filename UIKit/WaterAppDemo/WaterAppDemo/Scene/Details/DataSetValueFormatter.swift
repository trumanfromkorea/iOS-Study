//
//  DataSetValueFormatter.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/14.
//

import Charts
import Foundation

class DataSetValueFormatter: ValueFormatter {
    func stringForValue(_ value: Double,
                        entry: ChartDataEntry,
                        dataSetIndex: Int,
                        viewPortHandler: ViewPortHandler?) -> String {
        ""
    }
}

// 2
class XAxisFormatter: AxisValueFormatter {
    let titles = "ABCDEFGHI".map { "Party \($0)" }

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        titles[Int(value) % titles.count]
    }
}

// 3
class YAxisFormatter: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        "\(Int(value)) $"
    }
}
