import 'package:hive_flutter/hive_flutter.dart';
import '../models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static const String _boxName = 'tasks';

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static bool _isInitialized = false;

  Future<void> initDatabase() async {
    if (_isInitialized) return;

    await Hive.initFlutter();
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox(_boxName);
    }
    _isInitialized = true;
  }

  Box get _box => Hive.box(_boxName);

  // Get next available ID
  int _getNextId() {
    if (_box.isEmpty) return 1;

    // Find max ID and add 1
    int maxId = 0;
    for (var key in _box.keys) {
      if (key is int && key > maxId) {
        maxId = key;
      }
    }
    return maxId + 1;
  }

  // CREATE - Insert task
  Future<int> insertTask(Task task) async {
    await initDatabase();
    final id = _getNextId();
    final taskWithId = Task(
      id: id,
      title: task.title,
      description: task.description,
      status: task.status,
      deadline: task.deadline,
      category: task.category,
    );
    await _box.put(id, taskWithId.toJson());
    return id;
  }

  // READ - Get all tasks
  Future<List<Task>> getTasks() async {
    await initDatabase();
    try {
      final tasks = _box.values
          .map((taskData) {
            if (taskData is Map) {
              return Task.fromJson(Map<String, dynamic>.from(taskData));
            }
            return null;
          })
          .whereType<Task>()
          .toList();
      return tasks;
    } catch (e) {
      print('Error getting tasks: $e');
      return [];
    }
  }

  // READ - Get task by ID
  Future<Task?> getTaskById(int id) async {
    await initDatabase();
    try {
      final taskData = _box.get(id);
      if (taskData != null && taskData is Map) {
        return Task.fromJson(Map<String, dynamic>.from(taskData));
      }
      return null;
    } catch (e) {
      print('Error getting task by id: $e');
      return null;
    }
  }

  // UPDATE - Update task
  Future<int> updateTask(Task task) async {
    await initDatabase();
    await _box.put(task.id, task.toJson());
    return task.id;
  }

  // DELETE - Delete task
  Future<int> deleteTask(int id) async {
    await initDatabase();
    await _box.delete(id);
    return id;
  }

  // DELETE ALL
  Future<int> deleteAllTasks() async {
    await initDatabase();
    final count = _box.length;
    await _box.clear();
    return count;
  }
}
