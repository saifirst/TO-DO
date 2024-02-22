import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistapp/models/todo.dart';
import 'package:todolistapp/models/todo_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {super.key, required this.toDos, required this.onRemoveExpense});

  final List<ToDo> toDos;
  final void Function(ToDo expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: toDos.length,
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(toDos[index]),
              background: Container(
                decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Delete',
                    style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              child: ToDoItem(toDos[index]),
              onDismissed: (direction) => onRemoveExpense(toDos[index]),
            ));
  }
}
