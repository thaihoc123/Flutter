import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/components/custom_add_text_field.dart';
import '/components/custom_add_button.dart';
import '/models/todo_list.dart';
import '../components/custom_todo_item.dart';
import '/resourses/app_color.dart';
import '/components/custom_search_box.dart';
import '/components/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoDetail> results = [];
  List<ToDoDetail> _foundToDo = [];
  final todoList = ToDoDetail.todoList();
  final _addnewController = TextEditingController();
  final _searchController = TextEditingController();
  bool _showAddTextField = true;

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  void _leftPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.grey,
          title: const Text(
            'Alert',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.red,
            ),
          ),
          content: const Text(
            'Do you want to exit?',
            style: TextStyle(fontSize: 17),
          ),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAlert(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You have not done that yet!!'),
          content: const Text('Continue to delete?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  _foundToDo.removeWhere((item) => item.id == id);
                  todoList.removeWhere((item) => item.id == id);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showItem(String value) {
    if (value.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where(
              (item) => item.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  void _addToDo(String addNew) {
    setState(() {
      todoList.add(
        ToDoDetail(id: DateTime.now().millisecondsSinceEpoch, title: addNew),
      );
    });
  }

  void _addSearching(String addNew) {
    if (addNew.toLowerCase().contains(_searchController.text.toLowerCase())) {
      setState(() {
        _foundToDo.add(
          ToDoDetail(id: DateTime.now().millisecondsSinceEpoch, title: addNew),
        );
        _addToDo(addNew);
      });
    } else {
      _addToDo(addNew);
      setState(() {
        _foundToDo = todoList;
        _searchController.clear();
      });
    }
  }

  void _addNew(String addNew) {
    if (_searchController.text.isNotEmpty) {
      _addSearching(addNew);
    } else {
      _addToDo(addNew);
    }
  }

  void _checkExist(String addNew) {
    if (addNew.isNotEmpty) {
      bool isExist = false;
      for (ToDoDetail todo in todoList) {
        if (todo.title.toLowerCase() == addNew.toLowerCase()) {
          isExist = true;
          break;
        }
      }
      if (isExist) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "Seem like the job content is the same!!",
                style: TextStyle(color: AppColor.red),
              ),
              content: const Text("Do you want to continue?"),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () {
                    _addNew(addNew);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        _addNew(addNew);
      }
      _addnewController.clear();
    } else {
      _showAddTextField = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftPressed: _leftPressed,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 20),
                  child: CustomSearchBox(
                    onChanged: (_searchController) =>
                        _showItem(_searchController),
                    controller: _searchController,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                      height: 31.5, thickness: 1.5, color: AppColor.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView(
              children: [
                for (ToDoDetail todo in _foundToDo.reversed)
                  Dismissible(
                    key: UniqueKey(),
                    direction: todo.isDone
                        ? DismissDirection.endToStart
                        : DismissDirection.none,
                    onDismissed: (direction) {
                      setState(() {
                        _foundToDo.removeWhere((item) => item.id == todo.id);
                        todoList.removeWhere((item) => item.id == todo.id);
                      });
                    },
                    background: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      color: AppColor.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.delete, color: AppColor.white),
                        ],
                      ),
                    ),
                    child: ToDoItem(
                      todo: todo,
                      onChanged: () {
                        setState(() {
                          todo.isDone = !todo.isDone;
                          for (ToDoDetail td in todoList) {
                            if (td.id == todo.id) {
                              td.isDone = todo.isDone;
                            }
                          }
                        });
                      },
                      onDelete: () {
                        if (todo.isDone) {
                          setState(() {
                            _foundToDo
                                .removeWhere((item) => item.id == todo.id);
                            todoList.removeWhere((item) => item.id == todo.id);
                          });
                        } else {
                          _deleteAlert(todo.id);
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 100,
            child: Visibility(
              visible: _showAddTextField,
              child: CustomAddTextField(
                controller: _addnewController,
                autofocus: _showAddTextField,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: CustomAddButton(
              onPressed: () {
                if (_showAddTextField == false) {
                  _showAddTextField = true;
                  setState(() {});
                } else {
                  _checkExist(_addnewController.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
