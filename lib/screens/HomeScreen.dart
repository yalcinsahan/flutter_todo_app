import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/TaskController.dart';
import 'package:flutter_todo_app/screens/AddScreen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final TaskController _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildObx(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Obx buildObx() {
    return Obx(() => ListView.separated(
          itemCount: _controller.tasks.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            //kaydırılarak silinen itemler yapmak için
            final removedTask = _controller.tasks[index];
            return Dismissible(
              key: Key(removedTask.id),
              onDismissed: (direction) {
                _controller.removeTask(_controller.tasks[index].id);
              },
              child: buildListTile(index),
              background: Container(color: Colors.grey),
            );
          },
        ));
  }

  ListTile buildListTile(int index) {
    return ListTile(
      title: Text(
        _controller.tasks[index].title,
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          decoration: _controller.tasks[index].isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(_controller.tasks[index].description),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          color: Colors.green[700],
          icon: Icon(
              _controller.tasks[index].isDone ? Icons.remove : Icons.check),
          onPressed: () {
            _controller.taskIsDone(_controller.tasks[index].id);
          },
        ),
        IconButton(
          color: Colors.red[700],
          icon: Icon(Icons.delete),
          onPressed: () {
            _controller.removeTask(_controller.tasks[index].id);
          },
        ),
      ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("To Do App"),
      centerTitle: true,
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Get.to(AddPage());
      },
    );
  }
}
