import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Container(
        decoration: ,
        child: Column(
          children: [
            formAddWork(),
            listViewTodo()
          ],
        )
      ),
    );
  }

  Widget formAddWork(){
    return Text("abc");
  }

  Widget listViewTodo(){
    return Text("bcd");
  }
}
