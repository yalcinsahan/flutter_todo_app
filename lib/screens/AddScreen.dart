import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/TaskController.dart';
import 'package:flutter_todo_app/screens/HomeScreen.dart';
import 'package:get/get.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TaskController taskController = Get.put(TaskController());

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                buildTitle(),
                buildTitleInput(),
                buildDescriptionInput(),
                buildElevatedButton(),
              ],
            ),
          ),
        ));
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        taskController.addTask(
            titleController.text, descriptionController.text);

        Get.to(HomePage());
      },
      child: Text("Add Task"),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: 80),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 20),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
    );
  }

  Container buildTitleInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        controller: titleController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'enter task title',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }

  Container buildDescriptionInput() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
      child: TextField(
        controller: descriptionController,
        maxLines: 8,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'enter task description',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, bottom: 15),
      child: Text(
        "Add New Task",
        style: TextStyle(
          color: Colors.black,
          fontSize: 26,
        ),
      ),
    );
  }
}
