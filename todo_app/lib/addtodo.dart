import 'package:flutter/material.dart';
import 'myapp.dart';
import 'todo.dart';
// ignore: must_be_immutable
class AddTodo extends StatefulWidget{
  List<Todo> todoList;
  AddTodo({Key? key, required this.todoList}):super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController inputTextController = TextEditingController(); 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("todoApp",
        textDirection: TextDirection.ltr), 
        backgroundColor:const Color.fromARGB(255,26, 93, 193),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: inputTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Titulo",
                    hintTextDirection: TextDirection.ltr,
                    ),
                ),
                ElevatedButton(onPressed:(){
                  setState(() {
                     widget.todoList.add(Todo(name: inputTextController.text) );
                });
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp(todoList: widget.todoList)));
                },style: ButtonStyle(fixedSize: MaterialStateProperty.all(const Size(500,40)), backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromARGB(255,26, 93, 193)),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ))
                , child: const Text("Adicionar", style: TextStyle(color: Colors.black), textDirection: TextDirection.ltr,))
              ]
            ),
          ),
        ),
      ),
    );
  }
}