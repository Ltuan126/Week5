# UTH SmartTasks

> Ứng dụng quản lý công việc với kiến trúc MVVM và hỗ trợ offline

## Tính năng chính

### 1. Onboarding Flow

Hướng dẫn người dùng về tính năng chính của ứng dụng:

- Trang 1: Welcome - Hiển thị logo UTH và tên ứng dụng
- Trang 2: Easy Time Management
- Trang 3: Increase Work Effectiveness  
- Trang 4: Reminder Notification

**Tính năng Onboarding:**
- Cuộn giữa các trang sử dụng PageView
- Hiển thị tiến độ bằng page indicators (dấu chấm)
- Nút Back (quay lại trang trước)
- Nút Next (chuyển đến trang tiếp theo)
- Nút "Get Started" trên trang cuối cùng

### 2. Authentication

- Đăng nhập bằng Google Sign-In
- Tích hợp Firebase Authentication
- Tự động chuyển đến Dashboard sau khi đăng nhập

### 3. Dashboard (Home Screen)

Giao diện chính với Bottom Navigation Bar gồm 3 tabs:

#### Tab Home - Task List
- Hiển thị danh sách tasks
- Pull to refresh để cập nhật
- Nút FAB (+) để thêm task mới
- Hiển thị status badge: Pending, In Progress, Completed
- Hiển thị category badge: Work, Personal, Fitness, Study
- Empty state khi chưa có task
- Xóa task với confirmation dialog

#### Tab Calendar
- Placeholder cho tính năng lịch (chưa triển khai)

#### Tab Profile
- Hiển thị thông tin người dùng
- Avatar, Name, Email, Date of Birth
- Dữ liệu từ Google Account

### 4. Add Task Screen

Thêm task mới với các trường:

- **Task Title**: Tên công việc
- **Do Homework**: Checkbox
- **Category**: Dropdown (Work, Personal, Fitness, Study)
- **Status**: Dropdown (Pending, In Progress, Completed)
- **Description**: Mô tả chi tiết

**Tính năng:**
- Form validation
- Lưu task vào Hive Database
- Tự động quay về Task List sau khi thêm

### 5. Task Detail Screen

Xem chi tiết một task:

- Thông tin task: Title, Status, Deadline, Category, Description
- **Subtasks** với checkbox interactive
  - Tick/untick subtask
  - Text có gạch ngang khi hoàn thành
- **Attachments** (mock data)
- Loading, error states

## Kiến thức áp dụng

### 1. OOP (Object-Oriented Programming)

- Sử dụng Class để tạo các Screen (StatefulWidget, StatelessWidget)
- Task Model để quản lý dữ liệu task
- DatabaseHelper class cho database operations
- AuthService class cho authentication

### 2. Navigation

- Sử dụng Navigator để điều hướng giữa các màn hình
- MaterialPageRoute cho transitions
- pushReplacement cho login flow

### 3. MVVM Architecture

**Model - View - ViewModel pattern:**

- **Model**: `Task` class với `fromJson`, `toJson`
- **View**: Các Screen (TaskListScreen, AddTaskScreen, TaskDetailScreen)
- **ViewModel**: `TaskViewModel` với `ChangeNotifier`
  - `loadTasks()` - Load danh sách tasks
  - `addTask()` - Thêm task mới
  - `updateTask()` - Cập nhật task
  - `deleteTask()` - Xóa task
  - `getTaskById()` - Lấy task theo ID

**Provider Pattern:**
- Wrap app với `ChangeNotifierProvider`
- Sử dụng `Consumer` để lắng nghe thay đổi từ ViewModel
- UI tự động update khi data thay đổi

### 4. State Management

- Provider package cho state management
- ChangeNotifier cho reactive updates
- setState cho local state

### 5. Database

**Hive - NoSQL Local Database:**
- Box-based storage
- Key-value pairs
- Support cả Web, Mobile, Desktop
- Auto-increment ID system

## Tích hợp Firebase

Ứng dụng đã tích hợp Firebase Authentication:

### Firebase Authentication

- **Google Sign-In** integration
- Lưu thông tin user: uid, email, displayName, photoURL
- Tự động đăng xuất
- Hiển thị avatar trong Profile

**Cấu hình:**
- Firebase project initialized
- Google Sign-In enabled
- Web Client ID configured trong `web/index.html`
- Authorized JavaScript origins: `http://localhost`

## Database Offline - Hive

### Tính năng Offline-First

Ứng dụng hoạt động **100% offline** với Hive Database:

**DatabaseHelper Operations:**
- `insertTask()` - CREATE task
- `getTasks()` - READ all tasks
- `getTaskById()` - READ task by ID
- `updateTask()` - UPDATE task
- `deleteTask()` - DELETE task
- `deleteAllTasks()` - CLEAR database

**Lưu trữ:**
- **Web**: IndexedDB
- **Mobile**: Local storage
- **Desktop**: Local file system

**Data Persistence:**
- Tasks được lưu local
- Không mất khi tắt mạng
- Không mất khi reload (trừ khi reload khi offline)
- Chỉ mất khi clear browser data

### Cách test Offline:

1. Bật mạng, mở app
2. Thêm một vài tasks
3. Tắt mạng hoặc dùng Chrome DevTools (Network → Offline)
4. **Không reload trang** - Tiếp tục sử dụng app:
   - Thêm task mới
   - Xóa task
   - Xem detail
   - Tick subtasks
5. Bật lại mạng - Tất cả data vẫn còn!

## Cấu trúc Project

```
lib/
├── models/
│   └── task.dart                  # Task data model
├── viewmodels/
│   └── task_viewmodel.dart        # MVVM ViewModel
├── screens/
│   ├── onboarding_screen.dart     # Onboarding flow
│   ├── login_screen.dart          # Google Sign-In
│   ├── home_screen.dart           # Dashboard với Bottom Nav
│   ├── task_list_screen.dart      # Danh sách tasks
│   ├── add_task_screen.dart       # Thêm task mới
│   ├── task_detail_screen.dart    # Chi tiết task
│   └── profile_screen.dart        # Thông tin user
├── services/
│   ├── auth_service.dart          # Firebase Auth
│   └── task_service.dart          # API Service (optional)
├── database/
│   └── database_helper.dart       # Hive Database
├── firebase_options.dart
└── main.dart
```

## Tech Stack

- **Flutter** 3.x - UI Framework
- **Firebase Authentication** - Google Sign-In
- **Hive** - NoSQL Local Database
- **Provider** - State Management (MVVM)
- **Material Design 3** - Design System

## Installation

### Prerequisites
- Flutter SDK 3.x
- Firebase Project với Google Sign-In enabled

### Cài đặt

```bash
# Clone repository
git clone https://github.com/Ltuan126/Week5.git
cd Week5/uth_smarttasks

# Install dependencies
flutter pub get

# Run app
flutter run -d chrome
```

### Cấu hình Firebase

1. Thêm Google Client ID vào `web/index.html`:
```html
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
```

2. Cấu hình Authorized JavaScript origins trong Google Cloud Console:
   - `http://localhost`
   - `http://localhost:PORT`

## Luồng sử dụng

1. **Onboarding** → Xem 4 trang giới thiệu
2. **Login** → Đăng nhập Google
3. **Home** → Xem danh sách tasks
4. **Add Task** → Nhấn FAB (+)
5. **Task Detail** → Tap vào task card
6. **Profile** → Xem thông tin user

## Future Enhancements

- [ ] Calendar integration
- [ ] Task notifications
- [ ] PWA Support (Service Worker)
- [ ] Dark mode
- [ ] Task search & filter
- [ ] Cloud sync

---

**Made with by UTH Students**
