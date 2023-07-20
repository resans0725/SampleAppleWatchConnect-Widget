//
//  CountWidgetBundle.swift
//  CountWidget
//
//  Created by 永井涼 on 2023/05/06.
//

import WidgetKit
import SwiftUI

@main
struct CountWidgetBundle: WidgetBundle {
    var body: some Widget {
        CountWidget()
        CountWidgetLiveActivity()
    }
}
