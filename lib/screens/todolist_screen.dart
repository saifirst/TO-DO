import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todolistapp/models/todo.dart';
import 'package:todolistapp/models/todo_list.dart';

// import 'package:google_fonts/google_fonts.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() {
    return _ToDoListState();
  }
}

class _ToDoListState extends State<ToDoListScreen> {
  List<ToDo> toDoItems = [];
  List<ToDo> foundItems = [];
  final _taskController = TextEditingController();

  @override
  void initState() {
    foundItems = toDoItems;
    super.initState();
  }

  void _searchFor(String searchedword) {
    List<ToDo> resultList = [];
    if (searchedword.isEmpty) {
      resultList = toDoItems;
    } else {
      resultList = toDoItems
          .where((element) =>
              element.title.toLowerCase().contains(searchedword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundItems = resultList;
    });
  }

  void _submitInputs() {
    if (_taskController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please make sure of your inputs.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'))
                ],
              )));
      return;
    }
    toDoItems.insert(0, ToDo(title: _taskController.text, isDone: false));
  }

  void _removeexpense(ToDo expense) {
    final expenseIndex = toDoItems.indexOf(expense);
    setState(() {
      toDoItems.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Task deleted.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            toDoItems.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo.png',
          width: 50,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Color(int.parse('0xffE7E7E7')),
              ),
              child: TextField(
                onChanged: (value) => _searchFor(value),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(int.parse('0xFF9E9E9E')),
                      size: 24,
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.outfit(
                      color: Color(int.parse('0xFF9E9E9E')),
                      fontSize: 18,
                    )),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
                child: toDoItems.isEmpty
                    ? Center(
                        child: Text(
                        'No Tasks yet, Try add your tasks now👇🏻!',
                        style: GoogleFonts.outfit(
                            color: Colors.black, fontSize: 18),
                        textAlign: TextAlign.center,
                      ))
                    : ToDoList(
                        onRemoveExpense: _removeexpense, toDos: foundItems)),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xff7369E6')),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8))),
                        child: TextField(
                          style: GoogleFonts.outfit(
                              fontSize: 22, color: Colors.white),
                          controller: _taskController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'add a new task ...',
                              hintStyle: GoogleFonts.outfit(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(int.parse('0xff5A52B3')),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.5, horizontal: 16),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {
                          setState(() {
                            _submitInputs();
                          });
                          _taskController.clear();
                          FocusScope.of(context).unfocus();
                        },
                        child: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
