// stock_data_table.dart
import 'package:flutter/material.dart';

import '../../../Models/Stock.dart';
import 'package:project_login/Views/Component/Search/Search.dart';


class StockDataTable extends StatelessWidget {
  final List<StockData> stocks;
  final String sortColumn;
  final bool isAscending;
  final ValueChanged<String> onSortChanged;


  StockDataTable({
    required this.stocks,
    required this.sortColumn,
    required this.isAscending,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _getColumns(),
      rows: stocks!.map((stock) {
        return DataRow(cells: [
          DataCell(Text(stock.ticker)),
          DataCell(Text(stock.open.toString())),
          DataCell(Text(stock.close.toString())),
          DataCell(Text(stock.high.toString())),
          DataCell(Text(stock.low.toString())),
          DataCell(Text(stock.vol.toString())),
          DataCell(Text(stock.date)),
        ]);
      }).toList(),
    );
  }

  List<DataColumn> _getColumns() {
    return [
      _buildDataColumn('Ticker', 'ticker'),
      _buildDataColumn('Open', 'open'),
      _buildDataColumn('Close', 'close'),
      _buildDataColumn('High', 'high'),
      _buildDataColumn('Low', 'low'),
      _buildDataColumn('Volume', 'vol'),
      _buildDataColumn('Date', 'date'),
    ];
  }

  DataColumn _buildDataColumn(String label, String column) {
    return DataColumn(
      label: InkWell(
        onTap: () {
          onSortChanged(column);
        },
        child: Row(
          children: [
            Text(
                label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (sortColumn == column)
              Icon(isAscending ? Icons.arrow_upward : Icons.arrow_downward,size: 20,),

          ],
        ),
      ),
    );
  }
}
