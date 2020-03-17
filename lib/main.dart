import 'package:flutter/material.dart';

void main() {
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
  //so this is the list which is the main thind in todo list each of our item todo item is stored here in the list if we want to add more we
  //add more to this list or wanna to remove then we are going to remove our items from this list
  List<String> todoList = [];
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FLutter_Todo"),
        ),
        body: buildTodoBody(),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: FloatingActionButton(
              onPressed: (){
                removeTodoList(index);
              },
              child: Icon(Icons.remove),
              tooltip: "Remove item",
            ),
          ),
          
          FloatingActionButton(
            onPressed: addTodoList,
            child: Icon(Icons.add),
            tooltip: "add item",
          ),
        ]));
  }

  Widget buildTodoBody() {
    return ListView.builder(
        // itemCount: 2,
        itemBuilder: (context, index) {
      if (index < todoList.length) {
        return buildListTile(todoList[index],index);
      }
    });
  }

  Widget buildListTile(String title,int index) {
    this.index=index;
    return ListTile(
      title: Text(title),
      onTap: (){
        removeTodoList(index);
      },
    );
  }

  void addTodoList() {
    setState(() {
      int index = todoList.length;
      todoList.add("uzairleoTodo" + index.toString());
    });
  }
  void removeTodoList(int index)
  {
    setState((){
      todoList.removeAt(index);
    });
  }
}
