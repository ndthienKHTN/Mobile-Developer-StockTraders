import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){
                          //Open menu
                        },
                        icon: Icon(Icons.menu)),
                    Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                          ),
                        )
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}