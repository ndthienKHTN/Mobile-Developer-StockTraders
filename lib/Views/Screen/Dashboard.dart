import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_login/Models/Stock.dart';
import 'package:project_login/Views/BottomNavigation/Market/Market.dart';
import 'package:project_login/Views/Menu/menu.dart';
import 'package:project_login/Views/Component/Search.dart';
import 'package:provider/provider.dart';
import '../../Services/Websocket/Websocket_service.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<Dashboard>{
  late Future<void> _futureData;
  @override
  void initState() {
    super.initState();
    //Provider.of<StockService>(context, listen: false).connectToWebSocket();
    _futureData = Provider.of<StockService>(context, listen: false).connectToWebSocket();
  }
  @override
  void dispose() {
    Provider.of<StockService>(context, listen: false).disconnectFromWebSocket();
    super.dispose();
  }
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _searchQuery = '';
  bool _isAscending = true;
  String _sortColumn = 'ticker';

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
      drawer: Menu(),
      body: FutureBuilder<void>(
        future: _futureData,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError){
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
          }else{
            final stocks = Provider.of<StockService>(context).stocks;
            // Apply search filter
            final filteredStocks = stocks.where((stock) {
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
                              icon: Icon(Icons.menu)
                          ),
                          SearchBarCustom(onSearchChanged: _onSearchChanged),
                          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
                        ],
                      ),
                    )
                ),
                //_screens[_currentIndex],
                MarketScreen(
                  stocks: filteredStocks,
                  sortColumn: _sortColumn,
                  isAscending: _isAscending,
                  onSortChanged: _onSortChanged,
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(81, 87, 166, 1.0),
        selectedItemColor: Color.fromRGBO(54, 4, 245, 1.0),
        unselectedItemColor: Color.fromRGBO(81, 87, 166, 1.0),
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: "Market"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_sharp),
            label: "Watchlist"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.area_chart),
              label: "Trading"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: "Assets"
          ),
        ],

      ),
    );
  }
}
