class AddTodoRequest {
  String title;
  bool isCompleted;

  AddTodoRequest({required this.title, required this.isCompleted});

  Map<String, dynamic> toJson() => {
    "title": title,
    "isCompleted": isCompleted,
  };
}