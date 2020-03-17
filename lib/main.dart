import 'package:flutter/material.dart';

void main()
{
  runApp(new FlutterTodo());
}

class FlutterTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter_todo",
      debugShowCheckedModeBanner: false,
      home: TodoBody(),
    );
  }
}

class TodoBody extends StatefulWidget {
  @override
  _TodoBodyState createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("FLutter_Todo"),
         ),
         body: null,
         floatingActionButton: FloatingActionButton(
           onPressed: null,
           child: Icon(Icons.add),),
    );
  }
}