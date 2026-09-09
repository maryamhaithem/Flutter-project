import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    log("initState");
  }
  @override
  void dispose() {
    log("dispose");
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("didChangeDependencies");
  }
  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("didUpdateWidget");
  }
  @override
  void deactivate() {
    log("deactivate");
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        leading: Icon(Icons.menu ,color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              log("On Cliked !!");
            },
            icon:Icon(Icons.person , color: Color(0xFF57819A) ,)

          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(116),
                  color: Color(0xFF62B6CB)
              ),
              child: Column(
                children: [
                  Text("Increment"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                      log("Increment clicked");
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),


  Container(
    padding: EdgeInsets.all(20),
     width: double.infinity,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(116),
           color: Color(0xFFF7F4EF)
              ),
              child: Column(
                children: [
                  Text("Counter"),
                  Text("$counter"),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(116),
                  color: Color(0xFF57819A)
              ),
              child: Column(
                children: [
                  Text("Decrement"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                      log("Decrement clicked");
                    },
                    icon: Icon(Icons.remove) , color: Color(0xFFE7F1F1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF62B6CB),
        onPressed: () {
          setState(() {
            counter++;
          });
          log("Floating Action Button clicked");
        },
        child: Icon(Icons.add) ,
      ),
    );
  }
}
