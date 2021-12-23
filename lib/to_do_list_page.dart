import 'package:flutter/material.dart';
import 'package:flutter_to_do_list29112021/todo_model.dart';

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  late bool isShowForm;
  late List<ToDoModel> listToDoModels;

  @override
  void initState() {
    isShowForm = false;
    listToDoModels = [];
    super.initState();
  }

  void setShowForm(bool isShowForm) {
    setState(() {
      this.isShowForm = isShowForm;
    });
  }

  void addWork(ToDoModel toDoModel){
    setState(() {
      listToDoModels.add(toDoModel);
    });
  }

  void deleteWork(int position){
    setState(() {
      listToDoModels.removeAt(position);
    });
  }

  void updateWork(int position, ToDoModel toDoModel){
    setState(() {
      listToDoModels.replaceRange(position,position+1,[toDoModel]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            shouldShowForm(isShowForm, setShowForm , addWork),
            Expanded(
              child: ListView.builder(
                itemCount: listToDoModels.length,
                itemBuilder: (context , position){
                  return itemTodo(listToDoModels[position] , position ,deleteWork);
                },
              ),
            )
          ],
        ),
        // child: showTest(),
      ),
    );
  }

  Widget shouldShowForm(bool isShowForm, Function setShowForm, Function addWork) {
    final TextEditingController textTitle = TextEditingController();
    final TextEditingController textDescription = TextEditingController();
    if (isShowForm) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textTitle,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: textDescription,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        String title = textTitle.text.toString();
                        String description = textDescription.text.toString();

                        if(title.isEmpty || description.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ban chua truyen du thong tin")));
                          return;
                        }
                        addWork(ToDoModel(title: title , description: description));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.green),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red)
                            )),
                        fixedSize:
                        MaterialStateProperty.all(Size.fromHeight(50)),
                      ),
                      child: Text(
                        "Add work",
                        style: TextStyle(fontSize: 25),
                      )),
                ),
                Expanded(flex: 5, child: SizedBox()),
                Expanded(
                  flex: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        setShowForm(false);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red)
                            )),
                        fixedSize:
                        MaterialStateProperty.all(Size.fromHeight(50)),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 25),
                      )),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            setShowForm(true);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // side: BorderSide(color: Colors.red)
                  ))),
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 40,
            ),
          )),
    );
  }

  Widget itemTodo(ToDoModel toDoModel , int position , Function deleteWork) {
    return Container(
      child: InkWell(
        onTap: (){
          showDialog(
              context: context,
              builder: (context){
                final TextEditingController textTitle = TextEditingController();
                textTitle.text = toDoModel.title;
                final TextEditingController textDescription = TextEditingController();
                textDescription.text = toDoModel.description;
                return Dialog(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: textTitle,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: textDescription,
                          decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)))),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                  // setShowForm(false);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                  fixedSize:
                                  MaterialStateProperty.all(Size.fromHeight(50)),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(fontSize: 25),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                  if(textTitle.text.isEmpty || textDescription.text.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ban chua truyen du thong tin")));
                                      return;
                                  }
                                  updateWork(position, ToDoModel(title: textTitle.text, description: textDescription.text));
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.green),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                  fixedSize:
                                  MaterialStateProperty.all(Size.fromHeight(50)),
                                ),
                                child: Text(
                                  "Update",
                                  style: TextStyle(fontSize: 25),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        },
        child: ListTile(
          title: Text(toDoModel.title),
          subtitle: Text(toDoModel.description),
          trailing: IconButton(
            icon: Icon(Icons.delete , color: Colors.red),
            onPressed: (){
              deleteWork(position);
            },
          ),
        ),
      ),
    );
  }
}