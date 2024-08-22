import 'package:flutter/material.dart';
import 'package:project_login/Views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Dashboard.dart';

class Menu extends StatefulWidget{
  const Menu({Key? key}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu>{
  int _selectedIndex = 0;
  void _logout() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("isLoggedIn", false);
    if(context.mounted){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>LoginPage()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:Color.fromRGBO(140, 140, 238, 1.0),
            ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icon_stock.png", height: 60,),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "Welcom to my App",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                                backgroundColor: Color.fromRGBO(
                                    38, 10, 161, 1.0),
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey,
                                )
                            ),
                          ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                              _logout();
                          },
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color.fromRGBO(
                                  38, 10, 161, 1.0),
                              side: BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                              )
                          ),
                        ),
                      ),
                    ],
                  )
                ],
             )
          ),
          _buildWidgetItem(Icons.money, "Price Board", 0),
          _buildWidgetItem(Icons.star, "Watchlist", 1),
          _buildWidgetItem(Icons.notification_add_sharp, "Notifications", 2),
          _buildWidgetItem(Icons.assessment, "Assets Management", 3),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.5,
            color: Color.fromRGBO(20, 7, 72, 1.0),
          ),
          _buildWidgetItem(Icons.bar_chart, "Trading", 4),
          _buildWidgetItem(Icons.account_balance, "Account Management", 5),
          _buildWidgetItem(Icons.settings, "Top Stock", 6),
          _buildWidgetItem(Icons.donut_large, "Momo", 7),
          Divider(
            height: 0.5,
            color: Color.fromRGBO(2, 13, 82, 1.0),
          ),
          _buildWidgetItem(Icons.wallet, "Wallet", 8),
          _buildWidgetItem(Icons.info, "Infomation", 9),
          _buildWidgetItem(Icons.chat_rounded, "Statistic", 10),
          _buildWidgetItem(Icons.settings, "Setting", 11),
        ],
      ),
    );
  }
  Widget _buildWidgetItem(IconData icon, String title, int index){
    return InkWell(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        color: (index== _selectedIndex) ? Color.fromRGBO(187, 183, 245, 1.0) : null,
        child: ListTile(
          leading: Icon(icon),
          title: Text("$title"),
        ),
      ),
    );
  }
}