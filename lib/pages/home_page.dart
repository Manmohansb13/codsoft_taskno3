import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController=TextEditingController();
  final mybox=Hive.box("mybox");

  ToDoDataBase db=ToDoDataBase();

  void checkBoxChanged(bool ?value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updatedDataBase();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(controller: textController, onSave: saveNewTask, onCancel: () =>Navigator.pop(context),);
    });
  }

  void saveNewTask(){
    setState(() {
      if(!db.toDoList.contains(textController)){
        db.toDoList.add([textController.text,false]);
      }
      textController.clear();
      Navigator.pop(context);

    });
    db.updatedDataBase();
  }
  //delete task

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updatedDataBase();

  }

  @override
  void initState(){
    if(mybox.get("TODOLIST")==null){
      db.initialData();
    }
    else{
      //already data
      db.loadData();
    }
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6F61),
        title: Text("TO DO"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFA5D6A7),
        onPressed: createNewTask,
        child: Icon(Icons.add,color: Colors.black,),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return TodoTile(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1], onChanged: (value)=>checkBoxChanged(value,index), deleteFunction: (context ) =>deleteTask(index),);

        },

      ),
    );
  }
}
