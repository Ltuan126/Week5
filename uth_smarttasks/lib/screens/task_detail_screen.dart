import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskDetailScreen extends StatefulWidget {
  final int taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final TaskService _taskService = TaskService();
  Task? _task;
  bool _isLoading = true;
  String? _error;

  // Mock subtasks with state
  final List<Map<String, dynamic>> _subtasks = [
    {
      'text': 'This task is related to Fitness, It needs to be completed',
      'isChecked': false,
    },
    {
      'text': 'This task is related to Fitness, It needs to be completed',
      'isChecked': false,
    },
    {
      'text': 'This task is related to Fitness, It needs to be completed',
      'isChecked': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  Future<void> _loadTask() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final task = await _taskService.getTaskById(widget.taskId);
      setState(() {
        _task = task;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in progress':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: $_error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadTask,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : _task == null
          ? const Center(child: Text('Task not found'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Task Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            _task!.status,
                          ).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _task!.status,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _getStatusColor(_task!.status),
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (_task!.category.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.category,
                                size: 16,
                                color: Colors.purple.shade700,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _task!.category,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.purple.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Task Title
                  Text(
                    _task!.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Deadline
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _task!.deadline,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _task!.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Subtasks Section
                  const Text(
                    'Subtasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ..._subtasks.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> subtask = entry.value;
                    return _buildSubtask(
                      subtask['text'],
                      subtask['isChecked'],
                      index,
                    );
                  }).toList(),

                  const SizedBox(height: 32),

                  // Attachments Section
                  const Text(
                    'Attachments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildAttachment('document_1.pdf'),
                ],
              ),
            ),
    );
  }

  Widget _buildSubtask(String text, bool isChecked, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  _subtasks[index]['isChecked'] = value ?? false;
                });
              },
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: isChecked ? Colors.grey : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachment(String filename) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.attach_file, color: Colors.blue),
        title: Text(filename),
        trailing: IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {},
        ),
      ),
    );
  }
}
