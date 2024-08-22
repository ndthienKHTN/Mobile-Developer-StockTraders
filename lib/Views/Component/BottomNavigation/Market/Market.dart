import 'package:flutter/material.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';
import 'package:logger/logger.dart';
import 'package:project_login/Views/Component/BottomNavigation/Market/Stock_Market/Stock_Market.dart';

class MarketScreen extends StatefulWidget{
  const MarketScreen({Key? key}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _MarketState();
}

class _MarketState extends State<MarketScreen>{
  final List<String> categories = [
    'Stock Market',
    'Industry',
    'Index',
    'Derivatives',
    'Cover Warrants',
    'ETF',
    'Top Stock',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InfiniteScrollTabView(
          contentLength: categories.length,
          onTabTap: (index){
            debugPrint('bbb');
          },
          tabBuilder: (int index, bool isSelected) {
            return Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Color.fromRGBO(54, 4, 245, 1.0) : null,
              ),
            );
          },
          pageBuilder: (BuildContext context, int index, _) {
            if(index == 0){
              return StockMarket();
            }
            return Center(
              child: Text(
                  "Nothing",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },

        )
    );
  }
}