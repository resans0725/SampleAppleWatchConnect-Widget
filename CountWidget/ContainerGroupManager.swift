//
//  ContainerGroupManager.swift
//  CountWidgetExtension
//
//  Created by 永井涼 on 2023/05/06.
//

import Foundation

struct ContainerGroupManager {
    static var count: Int = 0
    
    mutating func setCount(){
        guard let count = UserDefaults(suiteName: "group.com.count.widget")?.object(forKey: "count")else{
            return
        }
        
        print("----------------------")
        print(count)
        
        ContainerGroupManager.count = count as? Int ?? 0
    }
}
