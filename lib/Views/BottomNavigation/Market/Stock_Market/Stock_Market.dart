import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_login/Models/Stock.dart';
import 'package:provider/provider.dart';

import '../../../Component/StockDataTable.dart';

class StockMarket extends StatefulWidget{
  //StockMarket({Key?key}): super(key:key);
  final List<StockData> stocks;
  final String sortColumn;
  final bool isAscending;
  final ValueChanged<String> onSortChanged;

  StockMarket({
    required this.stocks,
    required this.sortColumn,
    required this.isAscending,
    required this.onSortChanged,
  });
  @override
  State<StatefulWidget> createState() => _StockMarketState();

}
class _StockMarketState extends State<StockMarket> {
  List<String> _items =[
    'All',
    'Open > 2',
    'Volume > 10000',
  ];
  String _filterCriteria = 'All';
  void _onFilterChanged(String? criteria) {
    setState(() {
      _filterCriteria = criteria!;
    });
  }
  @override
  Widget build(BuildContext context) {
    final filteredStocks = widget.stocks.where((stock) {
      // Apply additional filtering based on selected criteria
      final meetsFilter = _applyFilter(stock);
      return  meetsFilter;
    }).toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  value: _filterCriteria,
                  items: _items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                          value,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: _onFilterChanged,
                  underline: Container(
                  height: 1,
                  color: Colors.black,),
              ),
            )

          ],
        ),
        Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StockDataTable(
                    stocks: filteredStocks,
                    isAscending : widget.isAscending,
                    sortColumn: widget.sortColumn,
                    onSortChanged: widget.onSortChanged,
                )
              ),
            )
        )
      ],
    );
  }
  bool _applyFilter(StockData stock) {
    switch (_filterCriteria) {
      case 'Open > 2':
        return stock.open > 2;
      case 'Volume > 10000':
        return stock.vol > 10000;
      default:
        return true; // 'All' hoặc không có tiêu chí lọc
    }
  }
}