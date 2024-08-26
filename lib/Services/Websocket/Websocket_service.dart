// stock_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../Models/Stock.dart';

class StockService with ChangeNotifier {
  WebSocketChannel? _channel;
  List<StockData> _stocks = [];
  List<StockData> get stocks => _stocks;
  List<StockData> _stocksChunk = [];
  List<StockData> get stocksChunk => _stocksChunk;
  int index = 0;


  Future<void> connectToWebSocket(int index) async{
    //await Future.delayed(Duration(seconds: 1));
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.132.209:8080'),  // Sử dụng địa chỉ IP của máy tính và cổng WebSocket
    );
    _channel?.sink.add('$index');
    _channel?.stream.listen((data) {
      try {
        final parsedData = json.decode(data);
        final stockTotalReals = parsedData['TotalTradeRealReply']['stockTotalReals'] as List<dynamic>;
        _stocksChunk = stockTotalReals.map((json) => StockData.fromJson(json)).toList();
        _stocks.addAll(_stocksChunk);
        print('Stock data: ${_stocksChunk.toString()}');
        notifyListeners();
      } catch (e) {
        print('Error parsing data: $e');
      }
    });
  }
  void updateIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
  void disconnectFromWebSocket() {
    _channel?.sink.close();
  }
  @override
  void dispose() {
    disconnectFromWebSocket();
    super.dispose();
  }
}
