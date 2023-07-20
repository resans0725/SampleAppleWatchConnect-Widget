//
//  ContentView.swift
//  countWatch Watch App
//
//  Created by 永井涼 on 2023/05/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var connector = PhoneConnector()
    
    var body: some View {
        VStack {
            VStack {
                Text(String(connector.count))
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                
                Button(
                    action: { self.connector.send() },
                    label: { Text("追加") }
                )
                .accentColor(Color.white)
                .background(Color(red: 30/255, green: 150/255, blue: 234/255))
                .cornerRadius(50)
            }
            
            Text("\(self.connector.receivedMessage)")
        }
    }
}


