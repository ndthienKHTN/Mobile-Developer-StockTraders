import 'package:flutter/material.dart';
class TradingScreen extends StatefulWidget{
  const TradingScreen({Key? key}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _TradingState();
}

class _TradingState extends State<TradingScreen>{
  @override
  Widget build(BuildContext context) {
    return Text("Trading Screen");
  }
}