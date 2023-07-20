//
//  CountWidget.swift
//  CountWidget
//
//  Created by 永井涼 on 2023/05/06.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        print(ContainerGroupManager.count)
        return SimpleEntry(date: Date(), count: ContainerGroupManager.count)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), count: ContainerGroupManager.count)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        
        var manager = ContainerGroupManager()
            manager.setCount()
        
        let entry = SimpleEntry(date: Date(), count: ContainerGroupManager.count)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    let count: Int
}

struct CountWidgetEntryView : View {
    var entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        Text("\(entry.count)")
    }
}

struct CountWidget: Widget {
    let kind: String = "CountWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            CountWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
