import 'package:flutter/material.dart';
import 'addtodo.dart';
import 'todo.dart';
// ignore: must_be_immutable
class MyApp extends StatefulWidget{
  List<Todo> todoList;
  MyApp({Key? key, required this.todoList})
  :super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Todo App",
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:const Color.fromARGB(255,26, 93, 193),
            title: const Text("todoApp"),
            centerTitle: true,
            actions: [
              FloatingActionButton(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255,26, 93, 193),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=>AddTodo(todoList: widget.todoList),
                  ),
                  );
                },
                child: const Icon(Icons.add_circle_outline_rounded,color: Colors.black,size:55,), 
                   
              ) 
            ]
            ),
          body: 
          (widget.todoList.isEmpty?
           const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[Align(
            alignment: Alignment.center,
            child: Text("Sua lista todo está\n vazia, use o botão\n de adicionar para\n colocar novos\n todos.",
            textAlign: TextAlign.center,style: TextStyle(fontSize: 20, 
            fontWeight: FontWeight.bold),
            )
            )
            ] 
           ): 
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.todoList.length,
                itemBuilder: (context, index){
                  return 
                      ListTile(
                        // ignore: prefer_const_constructors
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                setState(() {
                                widget.todoList[index].state=!widget.todoList[index].state;
                              }); 
                              },
                              child: (widget.todoList[index].state==true?
                              const Icon(Icons.check_box_outline_blank_outlined,color: Colors.green,):
                              const Icon(Icons.check_box_outline_blank_outlined,color: Colors.grey,)))
                          ],
                        ),
                        title: Text(widget.todoList[index].name),
                      );
                }
              )
          ),
        )
        ,)
    );
  }
}    
