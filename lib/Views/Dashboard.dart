import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_login/Views/Component/BottomNavigation/Assets/Assets.dart';
import 'package:project_login/Views/Component/BottomNavigation/Market/Market.dart';
import 'package:project_login/Views/Component/BottomNavigation/Trading/Trading.dart';
import 'package:project_login/Views/Component/BottomNavigation/Watchlist/Watchlist.dart';
import 'package:project_login/Views/Component/Menu/menu.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<Dashboard>{
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _screens = [
    MarketScreen(),
    WatchListScreen(),
    TradingScreen(),
    AssetsScreen()
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
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
                          _scaffoldKey.currentState?.openDrawer();
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
          ),
          _screens[_currentIndex],
        ],
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