import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('tasks');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Task"),
        backgroundColor: Colors.brown[900],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Add a Task',
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                      BorderRadius.all(Radius.circular(8.0)),
                        borderSide:
                      BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.green[900],
              onPressed: () {
                ref
                    .push()
                    .set(
                  title.text,
                )
                    .asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                "SAVE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}