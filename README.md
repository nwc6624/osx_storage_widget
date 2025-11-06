# StorageWidgetApp

A macOS SwiftUI app with a Widget Extension that displays storage capacity information.

## Project Structure

- **StorageWidgetApp**: Main macOS application
- **StorageWidgetExtension**: Widget extension that displays storage usage with a circular progress indicator

## Building and Testing

### Xcode Actions

1. **Product → Clean Build Folder** (⇧⌘K)

2. Select **StorageWidgetApp** scheme → Run (⌘R) once (installs host app)

3. Build the **StorageWidgetExtension** target

### macOS Actions

- Right-click desktop → **Edit Widgets** → search "Storage Capacity" or "StorageWidget" → add

If not visible:
- Run in Terminal:
  ```bash
  killall Dock; killall NotificationCenter
  ```
- Reopen Edit Widgets and add again

## Features

- Circular progress indicator showing storage usage percentage
- Internal drive icon
- Updates every 30 minutes
- Supports systemSmall, systemMedium, and systemLarge widget families

## Requirements

- macOS 14.0 or later
- Xcode 15.0 or later

