class StockData {
  final double close;
  final String date;
  final double high;
  final double low;
  final double open;
  final String ticker;
  final int vol;

  StockData({
    required this.close,
    required this.date,
    required this.high,
    required this.low,
    required this.open,
    required this.ticker,
    required this.vol,
  });

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      close: (json['close'] as num).toDouble(),
      date: json['date'],
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      open: (json['open'] as num).toDouble(),
      ticker: json['ticker'],
      vol: json['vol'],
    );
  }

  @override
  String toString() {
    return 'StockData{close: $close, date: $date, high: $high, low: $low, open: $open, ticker: $ticker, vol: $vol}';
  }
}