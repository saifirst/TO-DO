import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistapp/models/todo.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem(this.task, {super.key});
  final ToDo task;
  @override
  State<ToDoItem> createState() {
    return _ToDoItemState();
  }
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 7,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.task.isDone = !widget.task.isDone;
              });
            },
            icon: Icon(
              widget.task.isDone
                  ? Icons.check_box
                  : Icons.check_box_outline_blank_rounded,
              color: Color(int.parse('0xFF8075FF')),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.task.title,
            style: GoogleFonts.outfit(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w300,
                decoration: widget.task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
