import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFuntion;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged, 
    required this.deleteFuntion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25.0,top:25.0),
      child: Slidable(
        endActionPane: ActionPane(motion:StretchMotion(),
        children: [
          SlidableAction(onPressed: deleteFuntion,
          icon:Icons.delete,
          backgroundColor: Colors.red.shade300)
        ],),
        child: Container(
          padding: EdgeInsets.all(23),
          child: Row(
            children: [
        
              //checkbox
              Checkbox(value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.blue[900],
              ),
        
              //taskname
              Text(
                taskName,
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none, 
                  
                )
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, 
              borderRadius: BorderRadius.circular(15),
        
              ),
        ),
      ),
    );
  }
}
