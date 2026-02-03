class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String deadline;
  final String category;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.deadline,
    required this.category,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'Pending',
      deadline: json['deadline'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'deadline': deadline,
      'category': category,
    };
  }
}
