
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

// class TodoBody extends StatefulWidget {
//   @override
//   _TodoBodyState createState() => _TodoBodyState();
// }

// class _TodoBodyState extends State<TodoBody> {
//   List<String> todoList=[];
//   int index;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("practice_leo_Todo"),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment:MainAxisAlignment.end,
//         children: <Widget>
//         [
//           Padding(
//             padding: const EdgeInsets.only(bottom:8.0),
//             child: FloatingActionButton(onPressed: (){
//               try{
//               print(index);
//               removeFromList(index);
//               }catch(Exception )
//               {
//                 print("Sorry invalid list index");
//               }
              
//               },child:Icon(Icons.remove)),
//           ),
//           FloatingActionButton(onPressed: addToList,child:Icon(Icons.add)),
          
//         ]
//       ),

//       body: ListView.builder(
//         // itemCount: 2,
//         itemBuilder: (context, index){
         
//           if(index<todoList.length){
//            this.index=index;
//           return ListTile(
//             title: Text(todoList[index]),
//             onTap: (){
//               removeFromList(index);
//             },
//           );
//           }
//         }),
//     );
    
//   }
//   void addToList()
//   {
//     setState(() {
//       int index=todoList.length;
//       todoList.add(" value no  => "+ index.toString());
//     });
//   }
//   void removeFromList(int index)
//   {
//     setState(() {
//       todoList.removeAt(index);
//     });
//   }
// }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
             Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: FloatingActionButton(
                heroTag: "removeItem",
              onPressed: (){
                try{
                print(index);
                removeFromList(index);
                }catch(Exception)
                {
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Align(
                          alignment:Alignment.topCenter,
                          child:Text("SORRY"),
                        ),
                        content: Text("  No more items to remove"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: (){Navigator.pop(context);},
                             child: Text("Ok"))
                        ],
                      );
                    });
                }
              },
              child: Icon(Icons.remove),
              tooltip: "Remove item",
            ),
          ),
          
          FloatingActionButton(
            heroTag: "additem",
            onPressed: addNewScreen,
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
     showDialog(context: context,
     builder: (BuildContext context)
     {
       return AlertDialog(title:Text("Status"),
       content: Text("If u complete this task plz click mark"
       "as done option or cancel it"),
       actions: <Widget>[
         FlatButton(
           onPressed: (){
             removeFromList(index);
             Navigator.pop(context);
           }, 
         child: Text("Mark as done"),),
         FlatButton(onPressed: (){
           Navigator.pop(context);
         }, child: Text("Cancel"))
       ],
       );
       
     });
      },
    );
  }

  void addToList(String newTask) {
    setState(() {
      int index = todoList.length;
      todoList.add(newTask + index.toString());
    });
    
  }
  void removeFromList(int index)
  {
    setState((){
      todoList.removeAt(index);
    });
  }
  void addNewScreen()
  {
     Navigator.push(context,MaterialPageRoute(builder: (context)=>Scaffold(
      appBar: AppBar(
        title: Text("add note"),
      ),
      body: Center(
        child: Column(
          children:<Widget>[
            TextField(
              onSubmitted: (value){
                setState(() {
                  addToList(value);
                  Navigator.of(context).pop();
                });
              },
              decoration:InputDecoration(
                hintText:"Enter your task here",

              ),
            )
          ]
        ),
      ),
    )));
  }
}
//adding a save button logic in comment section
// RaisedButton(
//               onPressed: (){
//                 setState(() {
//                   result=addedString.text;
//                   addToList(result);
//                   Navigator.of(context).pop();
//                   addedString.clear();
//                 });
//               },
//             child:Text("Save"))

