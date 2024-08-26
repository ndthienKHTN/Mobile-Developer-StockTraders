import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_login/Models/Stock.dart';
import 'package:project_login/Views/BottomNavigation/Home/Home.dart';
import 'package:project_login/Views/Component/Menu/Menu.dart';
import 'package:project_login/Views/Component/Search/Search.dart';
import 'package:provider/provider.dart';
import '../../../Services/Websocket/Websocket_service.dart';
import '../../BottomNavigation/Chart/Chart.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<Dashboard>{
  late Future<void> _futureData; // Kiểm tra trạng thái của dữ liệu tải về
  late List<StockData> stocks; // Danh sách stock websocket trả về
  late List<StockData> filteredStocks;// Danh sách Stock sau khi tìm kiếm
  int _currentIndex = 0; // Chọn màn hình cần hiển thị
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // truy cập vào scaffold
  String _searchQuery = ''; //Tìm kiếm
  bool _isAscending = true; // Sắp xếp tăng hoặc giảm
  String _sortColumn = 'ticker'; // Sắp xếp theo Ticker
  @override
  void initState() {
    super.initState();
    //Provider.of<StockService>(context, listen: false).connectToWebSocket();
    _futureData = Provider.of<StockService>(context, listen: false).connectToWebSocket(0);
  }
  @override
  void dispose() {
    Provider.of<StockService>(context, listen: false).disconnectFromWebSocket();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }
  void _onSortChanged(String column) {
    setState(() {
      if (_sortColumn == column) {
        _isAscending = !_isAscending;
      } else {
        _sortColumn = column;
        _isAscending = true;
      }
    });
  }

  dynamic _getField(StockData stock, String column) {
    switch (column) {
      case 'ticker':
        return stock.ticker;
      case 'open':
        return stock.open;
      case 'close':
        return stock.close;
      case 'high':
        return stock.high;
      case 'low':
        return stock.low;
      case 'vol':
        return stock.vol;
      case 'date':
        return stock.date;
      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Menu(),
      body: FutureBuilder<void>(
        future: _futureData,
        builder: (context,snapshot)  {
          if(snapshot.connectionState == ConnectionState.waiting ){
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError){
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
          }else{
            stocks = Provider.of<StockService>(context).stocks;
            // Apply search filter
            filteredStocks = stocks.where((stock) {
              final tickerMatches = stock.ticker.toLowerCase().contains(_searchQuery.toLowerCase());
              return tickerMatches;
            }).toList();
            // Apply sorting
            filteredStocks.sort((a, b) {
              final fieldA = _getField(a, _sortColumn);
              final fieldB = _getField(b, _sortColumn);
              return _isAscending ? fieldA.compareTo(fieldB) : fieldB.compareTo(fieldA);
            });
            return Column(
              children: [
                SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                //Open menu
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: const Icon(Icons.menu)
                          ),
                          SearchBarCustom(onSearchChanged: _onSearchChanged),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
                        ],
                      ),
                    )
                ),
                if(_currentIndex == 0)HomeScreen(
                      stocks: filteredStocks,
                      sortColumn: _sortColumn,
                      isAscending: _isAscending,
                      onSortChanged: _onSortChanged,
                ) else  StockChart(stocks: filteredStocks,)

              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
        selectedItemColor: const Color.fromRGBO(33, 39, 225, 1.0),
        unselectedItemColor: const Color.fromRGBO(143, 148, 251, 1),
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
            label: "Chart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              label: "Watchlist"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: "Wallet"
          ),
        ],

      ),
    );
  }
}
