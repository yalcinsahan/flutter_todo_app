import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/TaskController.dart';
import 'package:flutter_todo_app/screens/AddScreen.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskController _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildListView(_controller.tasks.length),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  ListView buildListView(int taskNumber) {
    return ListView.separated(
      itemCount: taskNumber,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context, int index) {
        return buildListTile(index);
      },
    );
  }

  ListTile buildListTile(int index) {
    return ListTile(
      title: Text(
        _controller.tasks[index].title,
        style: TextStyle(
          decoration: _controller.tasks[index].isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          color: Colors.green[700],
          icon: Icon(
              _controller.tasks[index].isDone ? Icons.remove : Icons.check),
          onPressed: () {
            _controller.taskIsDone(_controller.tasks[index].id);
            setState(() => {});
          },
        ),
        IconButton(
          color: Colors.red[700],
          icon: Icon(Icons.delete),
          onPressed: () {
            _controller.removeTask(_controller.tasks[index].id);
            setState(() => {});
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
        /* _controller.addTask((taskNumber + 1).toString());
        setState(() {
          taskNumber = _controller.tasks.length;
        });*/
      },
    );
  }
}
