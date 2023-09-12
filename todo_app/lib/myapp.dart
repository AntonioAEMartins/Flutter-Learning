import 'package:flutter/material.dart';
import 'package:todo_app/todolistnotifier.dart';
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
        child: Align(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:const Color.fromARGB(255,26, 93, 193),
              title: const Text("todoApp"),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: FloatingActionButton(
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
                       
                  ),
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
                SizedBox(
                  child: 
                      Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                          padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.21),
                          shrinkWrap: true,
                          itemCount: TodoListNotifier.of(context).todoList.length,
                          itemBuilder: (context, index) {
                            return  ListTile(
                                // ignore: prefer_const_constructors
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        shadowColor: Colors.transparent
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          TodoListNotifier.of(context).todoList[index].state = !TodoListNotifier.of(context).todoList[index].state;
                                        });
                                      },
                                      child: (TodoListNotifier.of(context).todoList[index].state == true
                                          ? Ink(
                                              decoration: ShapeDecoration(
                                                color: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(0),
                                                  side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                              child: const SizedBox(
                                                width: 16,
                                                height: 16,
                                              ),
                                            )
                                          : Ink(
                                              decoration: ShapeDecoration(
                                                color: Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(0),
                                                  side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                              child: const SizedBox(
                                                width: 16,
                                                height: 16,
                                              ),
                                            )),
                                    )
                                  ],
                                ),
                                title: Text(TodoListNotifier.of(context).todoList[index].name,
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                              ); 
                          },
                        ),
                      ),
              )
            ),
          ),
        )
        ,)
    );
  }
}    
