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
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("Item $index"),
              subtitle: Text("Do item wqelkjq wlkejwqlekj lqwkejqw lkejwql kejqwl ekjqwlke jqwlkejq wklejqwl ekwq jelqwkjelqwkjeqw$index" , overflow: TextOverflow.ellipsis,),
              leading: Icon(Icons.add_photo_alternate_outlined),
              trailing: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
