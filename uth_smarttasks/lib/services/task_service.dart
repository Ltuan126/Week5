import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskService {
  static const String baseUrl = 'https://amock.io/api/researchUTH';

  // GET all tasks
  Future<List<Task>> getTasks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tasks'));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        // Kiểm tra xem response là array hay object
        List<dynamic> jsonData;
        if (decoded is List) {
          jsonData = decoded;
        } else if (decoded is Map && decoded.containsKey('tasks')) {
          jsonData = decoded['tasks'];
        } else if (decoded is Map && decoded.containsKey('data')) {
          jsonData = decoded['data'];
        } else {
          // Nếu là object, lấy giá trị đầu tiên là array
          jsonData = decoded.values.first;
        }

        return jsonData.map((json) => Task.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // GET task by ID
  Future<Task> getTaskById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/task/$id'));

      if (response.statusCode == 200) {
        return Task.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load task');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // DELETE task
  Future<void> deleteTask(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/task/$id'));

      // Accept nhiều status codes cho DELETE success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Success (200-299)
        return;
      } else if (response.statusCode == 404) {
        // Not found - có thể đã bị xóa rồi, coi như success
        return;
      } else {
        throw Exception('Failed to delete task: Status ${response.statusCode}');
      }
    } catch (e) {
      // Nếu là lỗi network hoặc CORS, log nhưng vẫn coi như success
      // để không làm gián đoạn UX
      print('Delete error (ignored): $e');
      // Không throw để UI vẫn update
      return;
    }
  }
}
