import 'package:flutter/material.dart';

class AssetsScreen extends StatefulWidget{
  const AssetsScreen({Key? key}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _AssetsState();
}

class _AssetsState extends State<AssetsScreen>{
  @override
  Widget build(BuildContext context) {
    return Text("Assets Screen");
  }
}