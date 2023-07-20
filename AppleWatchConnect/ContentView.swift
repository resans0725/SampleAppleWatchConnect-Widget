//
//  ContentView.swift
//  AppleWatchConnect
//
//  Created by 永井涼 on 2023/05/05.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var connector = WatchConnector()
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(
            red: 30/255,
            green: 150/255,
            blue: 234/255,
            alpha: 1.0
        )
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font : UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        navigationBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font : UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack{
                    Text("合計数")
                    Text(String(self.connector.count))
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                    
                    Text("\(self.connector.receivedMessage)")
                }
                .frame(maxHeight: .infinity)
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        self.connector.send()
                    }, label: {
                        Image(systemName: "plus")
                            .frame(width: 50, height: 50)
                    })
                    .padding()
                    .accentColor(Color.white)
                    .background(Color(red: 30/255, green: 150/255, blue: 234/255))
                    .font(.system(size: 30))
                    .cornerRadius(50)
                }
                .padding()
            }
            .frame(maxHeight: .infinity)
            .navigationTitle("Sample App")
        }
    }
}


