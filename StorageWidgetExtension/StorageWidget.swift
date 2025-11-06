import WidgetKit
import SwiftUI

struct StorageEntry: TimelineEntry {
  let date: Date
  let percent: Double   // 0...1
}

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> StorageEntry {
    StorageEntry(date: .now, percent: 0.88)
  }
  func getSnapshot(in context: Context, completion: @escaping (StorageEntry) -> Void) {
    completion( StorageEntry(date: .now, percent: 0.88) )
  }
  func getTimeline(in context: Context, completion: @escaping (Timeline<StorageEntry>) -> Void) {
    let entry = StorageEntry(date: .now, percent: 0.88)
    let next  = Calendar.current.date(byAdding: .minute, value: 30, to: .now)!
    completion( Timeline(entries: [entry], policy: .after(next)) )
  }
}

struct StorageWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    VStack(spacing: 8) {
      ZStack {
        Circle().stroke(lineWidth: 8).opacity(0.2)
        Circle()
          .trim(from: 0, to: entry.percent)
          .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
          .rotationEffect(.degrees(-90))
          .animation(.easeOut(duration: 0.6), value: entry.percent)
        Image(systemName: "internaldrive")
          .font(.system(size: 22, weight: .semibold))
      }
      .frame(width: 60, height: 60)
      Text("\(Int(entry.percent * 100))%")
        .font(.system(size: 14, weight: .semibold))
    }
    .padding()
  }
}

struct StorageWidget: Widget {
  let kind = "StorageWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      StorageWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Storage Capacity")
    .description("Shows your current storage usage.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

