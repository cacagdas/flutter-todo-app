class Todo {
  int? id;
  String? title;
  String? isCompleted;

  Todo.fromJson(Map json) :
      title = json["title"],
      isCompleted = json["isCompleted"],
      id = json["id"] as int;
}