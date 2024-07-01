import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartDemo extends StatelessWidget {
  ChartDemo({super.key});
  final List<SalesData> chartData = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Sales Analysis'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <LineSeries<SalesData,String>> [
          LineSeries(
            dataSource: chartData,
            name: 'Sales',
            dataLabelSettings: DataLabelSettings(isVisible: true),
            markerSettings: MarkerSettings(isVisible: true, color: Colors.red),
            xValueMapper: (SalesData sales,_)=> sales.month,
            yValueMapper:  (SalesData sales,_)=> sales.sales,
          )
        ],
      ),
    );
  }
}


class SalesData{
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
