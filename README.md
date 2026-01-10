# TareasSDP
TareasSDP is a simple and elegant task management app built with SwiftUI and SwiftData. 
The app allows users to create tasks with subtasks, mark subtasks as completed, and manage their task list efficiently.

## Features
- Add new tasks with customizable titles
- Mark subtasks as completed
- Swipe to delete tasks
- Interactive, expandable task rows
- SwiftUI-based user interface
- Data persistence powered by SwiftData

## Getting Started

### Prerequisites
- Xcode 26 or later
- iOS 26 or later

### Installation
1. Clone the repository:
```bash
git clone https://github.com/nacher8/TareasSDP.git
```

2. Open the project in Xcode:
```bash
cd TareasSDP
open TareasSDP.xcodeproj
```

3. Build and run the project on your simulator or device.

## Usage

1. **Add a Task**: Tap the "Add Task" button and enter a task title
2. **Add Subtasks**: Tap on a task to expand it and add subtasks
3. **Complete Subtasks**: Check off subtasks as you complete them
4. **Delete Tasks**: Swipe left on any task to delete it

## Technologies Used

- **SwiftUI** - Modern declarative UI framework
- **SwiftData** - Apple's data persistence framework
- **MVVM Architecture** - Clean separation of concerns

## Project Structure
```
TareasSDP/
├── Components/
│   ├── CheckBoxView.swift
│   └── TaskRowView.swift
├── Modifiers/
│   ├── AddTaskAlertModifier.swift
├── Views/
│   ├── EmptyView.swift
│   ├── TaskKistView.swift
├── ViewModel/
│   ├── TaskViewModel.swift
├── Models/
│   ├── Task.swift
├── System/
│   └── TareasSDPApp.swift
└── ContentView.swift
```
