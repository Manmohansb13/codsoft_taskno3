import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(BuildContext)? deleteFunction;
  Function(bool?)? onChanged;

  TodoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFA5D6A7),
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
              Text(
                taskName,
                style: TextStyle(color: Color(0xFF333333),decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none,fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
