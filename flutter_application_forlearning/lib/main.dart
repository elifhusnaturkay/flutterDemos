//import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColorLight: Color.fromARGB(255, 81, 39, 32),
            backgroundColor: Color.fromARGB(255, 201, 205, 215)),
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 201, 205, 215),
              title: Text('My First App'),
              titleTextStyle: const TextStyle(
                  fontSize: 40, color: Color.fromARGB(255, 131, 36, 67))),
          body: Container(
            color: Color.fromARGB(255, 201, 205, 215),
            // ignore: sort_child_properties_last
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.transparent),
                      color: Color.fromARGB(255, 255, 251, 245),
                    ),
                    padding: EdgeInsets.all(12),
                    height: 200,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.transparent),
                          color: Color.fromARGB(255, 255, 251, 245),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                  "https://avatars.githubusercontent.com/u/126392200?v=4"),
                            ),
                            Text("Title"),
                            Text("Description")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.transparent),
                      color: Color.fromARGB(255, 255, 251, 245),
                    ),
                    height: 200,
                    width: 400,
                    child: Row(
                      children: [],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.transparent),
                      color: Color.fromARGB(255, 255, 251, 245),
                    ),
                    height: 200,
                    width: 400,
                    child: Row(
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Color.fromARGB(255, 66, 94, 117),
            onPressed: () {
              debugPrint('Tıklandı');
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ));
  }
}
