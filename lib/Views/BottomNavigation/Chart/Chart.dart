import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../../../Models/Stock.dart';

class StockChart extends StatefulWidget{
  final List<StockData> stocks;
  const StockChart({super.key,
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
    return Expanded(
      child: SizedBox(
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
      ),
    );
  }
}
