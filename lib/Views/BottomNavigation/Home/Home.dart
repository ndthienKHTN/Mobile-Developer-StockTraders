import 'package:flutter/material.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';
import 'package:project_login/Models/Stock.dart';
import 'package:project_login/Views/BottomNavigation/Home/HomeTicker/HomeTicker.dart';

class HomeBar extends StatefulWidget {
  final List<StockData> stocks;
  final String sortColumn;
  final bool isAscending;
  final ValueChanged<String> onSortChanged;

  const HomeBar({
    super.key,
    required this.stocks,
    required this.sortColumn,
    required this.isAscending,
    required this.onSortChanged,
  });
  @override
  State<StatefulWidget> createState() => _MarketState();
}

class _MarketState extends State<HomeBar> {
  final List<String> categories = [
    'Ticker',
    'Analyst',
    'Future',
    'Explore',
    'Transfer',
    'Trading',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InfiniteScrollTabView(
          contentLength: categories.length,
          onTabTap: (index) {
            debugPrint('In market Screen');
          },
        tabBuilder: (int index, bool isSelected) {
          return Text(
            categories[index],
            style: TextStyle(
              color: isSelected ? const Color.fromRGBO(54, 4, 245, 1.0) : null,
            ),
          );
        },
        pageBuilder: (BuildContext context, int index, _) {
          if (index == 0) {
            return HomeTicker(
              stocks: widget.stocks,
              isAscending: widget.isAscending,
              sortColumn: widget.sortColumn,
              onSortChanged: widget.onSortChanged,
            );
          }
        return const Center(
          child: Text(
            "Nothing",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        );
      },
    ));
  }
}
