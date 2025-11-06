# StorageWidgetApp

A macOS SwiftUI app with a Widget Extension that displays storage capacity information.

## Project Structure

- **StorageWidgetApp**: Main macOS application
- **StorageWidgetExtension**: Widget extension that displays storage usage with a circular progress indicator

## Building and Testing

### Xcode Steps

1. **Product → Clean Build Folder** (⇧⌘K)

2. Select **StorageWidgetApp** scheme → Run (⌘R) once (this installs the app)

3. Build **StorageWidgetExtension** target

### macOS Steps

- Right-click desktop → **Edit Widgets** → search "StorageWidget" → add

If not visible: run in Terminal:
```bash
killall Dock; killall NotificationCenter
```
then re-open Edit Widgets and try again.

## Features

- Circular progress indicator showing storage usage percentage
- Internal drive icon
- Updates every 30 minutes
- Supports systemSmall, systemMedium, and systemLarge widget families

## Requirements

- macOS 14.0 or later
- Xcode 15.0 or later

