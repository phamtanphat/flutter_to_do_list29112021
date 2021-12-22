import 'package:flutter/material.dart';



class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {

  bool isShowForm = false;

  void setShowForm(bool isShowForm) {
    setState(() {
      isShowForm = isShowForm;
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
        child: shouldShowForm(isShowForm,setShowForm),
        // child: showTest(),
      ),
    );
  }

  Widget shouldShowForm(bool isShowForm, Function setShowForm) {
    if (isShowForm){
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
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
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

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red)
                            )),
                        fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
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
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red)
                            )),
                        fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 25),
                      )),
                ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
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
            style: TextStyle(fontSize: 40,),
          )),
    );
  }

  Widget showTest(){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[500],
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("View"),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

}

