import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList=[];
  final _mybox=Hive.box("mybox");


  //intial data

void initialData(){
  toDoList=[
    ['Make Tutorials',false],
    ['Study',false]
  ];
}


void loadData(){
  toDoList=_mybox.get('TODOLIST');
}

void updatedDataBase(){
  _mybox.put("TODOLIST",toDoList);
}

}