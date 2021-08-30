//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 장재훈 on 2021/08/30.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 11"/*@END_MENU_TOKEN@*/)
    }
}
