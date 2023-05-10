class ToDoDetail {
  int id;
  String title;
  bool isDone;

  ToDoDetail({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  static List<ToDoDetail> todoList() {
    return [
      ToDoDetail(id: 1, title: 'To Do Detail 1 z'),
      ToDoDetail(id: 2, title: 'To Do Detail 2 x'),
      ToDoDetail(id: 3, title: 'To Do Detail 3 b'),
      ToDoDetail(id: 4, title: 'To Do Detail 4'),
      ToDoDetail(id: 5, title: 'To Do Detail 5'),
      ToDoDetail(id: 6, title: 'To Do Detail 6'),
      ToDoDetail(id: 7, title: 'To Do Detail 7'),
      ToDoDetail(id: 8, title: 'To Do Detail 8'),
      ToDoDetail(id: 9, title: 'To Do Detail 9'),
      ToDoDetail(id: 10, title: 'To Do Detail 10'),
      ToDoDetail(id: 11, title: 'To Do Detail Doing Exercise 11'),
      ToDoDetail(id: 12, title: 'To Do Detail 12'),
      ToDoDetail(id: 13, title: 'To Do Detail 13'),
      ToDoDetail(id: 14, title: 'To Do Detail 14'),
    ];
  }
}
