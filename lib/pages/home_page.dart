import 'package:flutter/material.dart';
import 'package:shukri_application_1/util/dialog_box.dart';
import 'package:shukri_application_1/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controller
  final _controller=TextEditingController();
  
  //list of todo task
  List toDoList = [
    ["Make Tutorial", false],
    ["Do exercise", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
     Navigator.of(context).pop();
  }

  void createNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave:saveNewTask,
            onCancel:() => Navigator.of(context).pop, // it dismiss the dialog box
          );
        },
      );
    }

    //delete task
    void deleteTask(int index){
      setState(() {
        toDoList.removeAt(index);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("TO DO"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFuntion:(context)=> deleteTask,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child:  Icon(Icons.add),
      ),
    );
  }
}