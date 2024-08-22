import 'package:flutter/material.dart';

class WatchListScreen extends StatefulWidget{
  const WatchListScreen({Key? key}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _WatchListState();
}

class _WatchListState extends State<WatchListScreen>{
  @override
  Widget build(BuildContext context) {
    return Text("WatchList Screen");
  }
}