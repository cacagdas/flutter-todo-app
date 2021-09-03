class Todo {
  int id;
  String? title;
  bool isCompleted;

  Todo.fromJson(Map json)
      : title = json["title"],
        isCompleted = json["isCompleted"],
        id = json["id"] as int;
}
