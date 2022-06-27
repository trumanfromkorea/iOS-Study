//
//  AudioModel.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import Foundation

struct AudioModel {
    static func durationString(_ duration: Int) -> String {
        var result = ""

        let min = duration / 60
        let sec = duration % 60

        result += min < 10 ? "0\(min):" : "\(min):"
        result += sec < 10 ? "0\(sec)" : "\(sec)"

        return result
    }
}

struct AudioCellItem {
    var title: String
    var duration: String
}
