import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_login/Models/Stock.dart';
import 'package:provider/provider.dart';

import '../../../../Services/Websocket/WebsocketService.dart';
import '../../../Component/DataTable/StockDataTable.dart';

class HomeTicker extends StatefulWidget{
  //StockMarket({Key?key}): super(key:key);
  final List<StockData> stocks;
  final String sortColumn;
  final bool isAscending;
  final ValueChanged<String> onSortChanged;

  HomeTicker({
    required this.stocks,
    required this.sortColumn,
    required this.isAscending,
    required this.onSortChanged,
  });
  @override
  State<StatefulWidget> createState() => _StockMarketState();

}
class _StockMarketState extends State<HomeTicker> {
  final List<String> _items =[
    'All',
    'Open > 2',
    'Volume > 10000',
  ];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  String _filterCriteria = 'All';
  void _onFilterChanged(String? criteria) {
    setState(() {
      _filterCriteria = criteria!;
    });
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
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      debugPrint("Scroll max");
      _loadMoreData();
    }
  }
  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    final indexPage = Provider.of<StockService>(context, listen: false).index;
    Provider.of<StockService>(context, listen: false).connectToWebSocket((indexPage+1)*20+1);
    Provider.of<StockService>(context, listen: false).updateIndex(indexPage+1);
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  value: _filterCriteria,
                  items: _items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                          value,
                        style: const TextStyle(
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
              child: Column(
                children:[
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: _scrollController,
                        child: StockDataTable(
                          stocks: filteredStocks,
                          isAscending : widget.isAscending,
                          sortColumn: widget.sortColumn,
                          onSortChanged: widget.onSortChanged,
                        )
                    ),
                  ),
                  if (_isLoading) // Hiển thị vòng quay tải khi đang tải thêm dữ liệu
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                ]
              ),
            ),
        )
      ],
    );
  }

}