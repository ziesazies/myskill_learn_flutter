class TaskModel {
  final int id;
  final String title;
  final String description;
  final DateTime dateTime;
  final DateTime createTime;
  final bool isFinished;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.createTime,
    required this.isFinished,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date_time": dateTime.toIso8601String(),
      "create_time": createTime.toIso8601String(),
      "is_finished": isFinished,
    };
  }

  factory TaskModel.fromJson(Map<dynamic, dynamic> json) => TaskModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    dateTime: json['date_time'],
    createTime: json['create_time'],
    isFinished: json['is_finished'],
  );
}
