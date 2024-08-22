import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockMarket extends StatefulWidget{
  StockMarket({Key?key}): super(key:key);
  @override
  State<StatefulWidget> createState() => _StockMarketState();

}
class _StockMarketState extends State<StockMarket> {
  List<String> _items =[
    'VN30',
    'HOSE',
    'HNX',
    'UPCOM'
  ];
  String _selectedIndex ='';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton(
                  hint: Text("Select Ticker"),
                  icon: Icon(Icons.arrow_drop_down),
                  value: _selectedIndex.isEmpty ? null : _selectedIndex,
                  items: _items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? selectedItem){
                    setState(() {
                      _selectedIndex = selectedItem ?? '';
                    });
                  }
              ),
            )

          ],
        ),
        Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Ticker")),
                    DataColumn(label: Text("Close")),
                    DataColumn(label: Text("Date")),
                    DataColumn(label: Text("High")),
                    DataColumn(label: Text("Low")),
                    DataColumn(label: Text("Open")),
                    DataColumn(label: Text("Vol")),
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(Text("BTH")),
                          DataCell(Text("32.2")),
                          DataCell(Text("2024-08-22")),
                          DataCell(Text("32.2")),
                          DataCell(Text("32.2")),
                          DataCell(Text("32.2")),
                          DataCell(Text("400")),
                        ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("GDA")),
                        DataCell(Text("27.6")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("28.2")),
                        DataCell(Text("27.5")),
                        DataCell(Text("27.9")),
                        DataCell(Text("78400")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),

                    DataRow(
                      cells: [
                        DataCell(Text("BTG")),
                        DataCell(Text("7.2")),
                        DataCell(Text("2024-08-22")),
                        DataCell(Text("12.2")),
                        DataCell(Text("32.2")),
                        DataCell(Text("43.2")),
                        DataCell(Text("200")),
                      ],
                    ),
                  ],
                ),
              ),
            )
        )

      ],
    );
  }
}