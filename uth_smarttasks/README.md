# 📱 UTH SmartTasks

> A modern, offline-first task management application built with Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Authentication-FFCA28?logo=firebase)](https://firebase.google.com)
[![Hive](https://img.shields.io/badge/Hive-Database-orange)](https://docs.hivedb.dev)
[![MVVM](https://img.shields.io/badge/Architecture-MVVM-blue)](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)

## 📋 Tổng quan

UTH SmartTasks là ứng dụng quản lý công việc (To-Do App) được xây dựng với Flutter, áp dụng kiến trúc **MVVM** và sử dụng **Hive Database** để hỗ trợ hoạt động hoàn toàn **offline**.

### ✨ Tính năng chính

- 🎯 **Quản lý Tasks**: Tạo, xem, cập nhật, xóa công việc
- 📱 **Onboarding**: Giới thiệu ứng dụng cho người dùng mới
- 🔐 **Google Sign-In**: Xác thực qua tài khoản Google
- 💾 **Offline-First**: Hoạt động hoàn toàn offline với Hive Database
- 🎨 **Material Design 3**: Giao diện hiện đại, responsive
- 📊 **Task Status**: Pending, In Progress, Completed
- 🏷️ **Categories**: Work, Personal, Fitness, Study
- ✅ **Subtasks**: Checkbox interactive cho sub-tasks
- 🔄 **Pull to Refresh**: Cập nhật danh sách task
- 📱 **Responsive**: Tương thích mobile và desktop

## 🏗️ Kiến trúc

Ứng dụng được xây dựng theo mô hình **MVVM (Model-View-ViewModel)**:

```
lib/
├── models/           # Data models (Task)
├── views/            # UI Screens
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── task_list_screen.dart
│   ├── task_detail_screen.dart
│   ├── add_task_screen.dart
│   └── profile_screen.dart
├── viewmodels/       # Business logic (TaskViewModel)
├── services/         # External services (Auth, API)
├── database/         # Local database (Hive)
└── main.dart         # Entry point
```

### Luồng dữ liệu MVVM

```
View (UI) ←→ ViewModel (Logic) ←→ Model (Data)
              ↓
         Database (Hive)
```

## 🛠️ Tech Stack

### Core
- **Flutter** 3.x - UI Framework
- **Dart** - Programming Language
- **Provider** - State Management

### Backend & Auth
- **Firebase Auth** - Authentication
- **Google Sign-In** - OAuth Integration

### Database
- **Hive** - NoSQL Local Database (Offline-first)
- **Hive Flutter** - Flutter integration

### UI/UX
- **Material Design 3** - Design System
- **Google Fonts** - Typography

## 📦 Installation

### Prerequisites

- Flutter SDK 3.x
- Dart SDK
- Android Studio / VS Code
- Firebase Project (với Google Sign-In enabled)

### Bước 1: Clone repository

```bash
git clone https://github.com/yourusername/uth_smarttasks.git
cd uth_smarttasks
```

### Bước 2: Install dependencies

```bash
flutter pub get
```

### Bước 3: Cấu hình Firebase

1. Tạo Firebase project tại [Firebase Console](https://console.firebase.google.com)
2. Enable **Google Authentication**
3. Thêm Web App vào project
4. Copy Client ID và thêm vào `web/index.html`:

```html
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID_HERE">
```

5. Cấu hình **Authorized JavaScript origins**:
   - `http://localhost`
   - `http://localhost:PORT`

### Bước 4: Run app

```bash
# Web
flutter run -d chrome

# Mobile
flutter run -d <device_id>
```

## 🚀 Usage

### 1. Onboarding
- Xem 4 trang giới thiệu ứng dụng
- Swipe hoặc nhấn Next/Back

### 2. Login
- Đăng nhập bằng Google Account
- Tự động chuyển đến Dashboard

### 3. Dashboard (Home Screen)
- **Home Tab**: Danh sách tasks
- **Calendar Tab**: (Placeholder)
- **Profile Tab**: Thông tin người dùng

### 4. Quản lý Tasks

#### Thêm Task
1. Nhấn nút **+** (FAB)
2. Điền thông tin:
   - Task title
   - Do homework (checkbox)
   - Category (dropdown)
   - Status (dropdown)
   - Description
3. Nhấn **Add**

#### Xem Task Detail
- Tap vào task card
- Xem thông tin chi tiết, subtasks, attachments

#### Xóa Task
- Nhấn icon 🗑️ trên task card
- Confirm deletion

## 🧪 Testing Offline Mode

### ✅ Cách test ĐÚNG:

**Bước 1**: Bật mạng và mở app
```bash
flutter run -d chrome
```

**Bước 2**: Thêm một vài tasks

**Bước 3**: Tắt mạng hoặc dùng Chrome DevTools
- Mở DevTools (F12)
- Tab Network → chọn "Offline"

**Bước 4**: Test các tính năng (KHÔNG reload trang)
- ✅ Thêm task mới
- ✅ Xóa task
- ✅ Xem detail
- ✅ Tick subtasks

**Bước 5**: Bật lại mạng
- Tất cả data vẫn còn nguyên!

### ❌ Lưu ý:
- **KHÔNG** reload trang (F5) khi offline
- Reload = load lại HTML/JS/CSS = cần internet
- Hive DB chỉ lưu data, không cache app resources

## 📂 Project Structure

```
uth_smarttasks/
├── android/              # Android platform
├── ios/                  # iOS platform
├── web/                  # Web platform
├── lib/
│   ├── models/
│   │   └── task.dart              # Task data model
│   ├── viewmodels/
│   │   └── task_viewmodel.dart    # MVVM ViewModel
│   ├── screens/
│   │   ├── onboarding_screen.dart
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── task_list_screen.dart
│   │   ├── add_task_screen.dart
│   │   ├── task_detail_screen.dart
│   │   └── profile_screen.dart
│   ├── services/
│   │   ├── auth_service.dart      # Firebase Auth
│   │   └── task_service.dart      # API Service (optional)
│   ├── database/
│   │   └── database_helper.dart   # Hive DB
│   ├── firebase_options.dart      # Firebase config
│   └── main.dart                  # App entry point
├── assets/
│   ├── uth_logo.png
│   ├── onboarding1.JPG
│   ├── onboarding2.JPG
│   └── onboarding3.JPG
├── pubspec.yaml
└── README.md
```

## 🎨 Screenshots

### Onboarding Flow
- Trang 1: Welcome với logo UTH
- Trang 2: Easy Time Management
- Trang 3: Increase Work Effectiveness
- Trang 4: Reminder Notification

### Main Screens
- **Login**: Google Sign-In
- **Home**: Task List với Bottom Navigation
- **Add Task**: Form thêm task mới
- **Task Detail**: Chi tiết task, subtasks, attachments
- **Profile**: Thông tin user

## 📝 API Reference

### TaskViewModel

```dart
class TaskViewModel extends ChangeNotifier {
  Future<void> loadTasks();           // Load tất cả tasks
  Future<bool> addTask(Task task);    // Thêm task mới
  Future<bool> updateTask(Task task); // Cập nhật task
  Future<bool> deleteTask(int id);    // Xóa task
  Future<Task?> getTaskById(int id);  // Lấy task theo ID
}
```

### DatabaseHelper

```dart
class DatabaseHelper {
  Future<int> insertTask(Task task);       // CREATE
  Future<List<Task>> getTasks();           // READ all
  Future<Task?> getTaskById(int id);       // READ by ID
  Future<int> updateTask(Task task);       // UPDATE
  Future<int> deleteTask(int id);          // DELETE
  Future<int> deleteAllTasks();            // CLEAR
}
```

## 🔧 Configuration

### Firebase (web/index.html)

```html
<meta name="google-signin-client_id" 
      content="YOUR_CLIENT_ID.apps.googleusercontent.com">
```

### Hive Database

- **Box name**: `tasks`
- **Storage**: IndexedDB (Web), Local Storage (Mobile)
- **Auto-increment ID**: Yes

## 🐛 Known Issues

1. **Web Offline Reload**: Không thể reload trang khi offline (cần Service Worker/PWA)
2. **Calendar Tab**: Chưa implement (placeholder)
3. **SQLite on Web**: Không support → đã đổi sang Hive

## 🚧 Future Enhancements

- [ ] PWA Support (Service Worker)
- [ ] Calendar integration
- [ ] Task notifications
- [ ] Dark mode
- [ ] Multi-language support
- [ ] Cloud sync với Firebase/API
- [ ] Task search & filter
- [ ] Task statistics

## 👨‍💻 Development

### Run in development

```bash
flutter run -d chrome
```

### Build for production

```bash
# Web
flutter build web

# Android
flutter build apk

# iOS
flutter build ios
```

### Hot Reload

Press `r` in terminal or save file

### Hot Restart

Press `R` in terminal

## 📄 License

This project is created for educational purposes.

## 🙏 Credits

- **University of Transport Ho Chi Minh City (UTH)**
- **Flutter Team** - Framework
- **Firebase** - Authentication
- **Hive** - Local Database

---

**Made with ❤️ by UTH Students**
