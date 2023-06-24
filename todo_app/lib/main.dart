import 'package:flutter/material.dart';
//
void main() {
  runApp(MaterialApp(
    // ignore: prefer_const_literals_to_create_immutables
    home: MyApp(todoList: []),
  ));
}
// ignore: must_be_immutable
class MyApp extends StatefulWidget{
  List<String> todoList;
  MyApp({Key? key, required this.todoList})
  :super(key: key);
  bool isChecked = false;
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
           Align(
             child: ListView.builder(
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
                                  widget.isChecked= !widget.isChecked;
                                });
                              }, 
                              child: (
                                widget.isChecked==true?
                                // ignore: prefer_const_constructors
                                Icon(Icons.check_box_outline_blank,color: Colors.green,):
                                // ignore: prefer_const_constructors
                                Icon(Icons.check_box_outline_blank,color: Colors.grey,)
                              ))
                          ],
                        ),
                        title: Text(widget.todoList[index]),
                      );
                }
                       ),
           )
          ),
        )
        ,)
    );
  }
}    
// ignore: must_be_immutable
class AddTodo extends StatefulWidget{
  List<String> todoList;
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
                     widget.todoList.add(inputTextController.text );
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