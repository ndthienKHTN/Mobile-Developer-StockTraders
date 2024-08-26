import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../Models/Stock.dart';
import '../../../Services/Websocket/Websocket_service.dart';

class StockChart extends StatefulWidget{
  //const StockChart({super.key});
  final List<StockData> stocks;
  StockChart({
    required this.stocks,
  });
  @override
  State<StatefulWidget> createState() => _StockChartState();
}

class _StockChartState extends State<StockChart>{
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3*2,
      child: Column(
        children: [
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.yMd(),
                intervalType: DateTimeIntervalType.days,
                enableAutoIntervalOnZooming: true,
              ),
              zoomPanBehavior: ZoomPanBehavior( // Hỗ trợ zoom và pan
                enablePinching: true,
                enablePanning: true,
              ),
              series: <ChartSeries>[
                CandleSeries<StockData, DateTime>(
                  dataSource: widget.stocks,
                  xValueMapper: (StockData data, _) => DateTime.parse(data.date),
                  lowValueMapper: (StockData data, _) => data.low,
                  highValueMapper: (StockData data, _) => data.high,
                  openValueMapper: (StockData data, _) => data.open,
                  closeValueMapper: (StockData data, _) => data.close,
                ),
                ColumnSeries<StockData, DateTime>(
                  dataSource: widget.stocks,
                  xValueMapper: (StockData data, _) => DateTime.parse(data.date),
                  yValueMapper: (StockData data, _) => data.vol.toDouble(),
                  yAxisName: 'volumeAxis',
                ),
              ],
              axes: <ChartAxis>[
                NumericAxis(
                  name: 'volumeAxis',
                  opposedPosition: true,
                  interval: 100.0,
                  title: AxisTitle(text: 'Volume'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
