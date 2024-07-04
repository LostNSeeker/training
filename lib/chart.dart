import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MultiChartExp extends StatefulWidget {
  const MultiChartExp({super.key});

  @override
  State<MultiChartExp> createState() => _MultiChartExpState();
}

class _MultiChartExpState extends State<MultiChartExp> {

  final List<ChartData> chartData = <ChartData>[
    /*ChartData(x: '2005', yValue1: 997281, yValue2: 17.74),
    ChartData(x: '2006', yValue1: 1063599, yValue2: 19.23),
    ChartData(x: '2007', yValue1: 1063964, yValue2: 15.43),
    ChartData(x: '2008', yValue1: 1152123, yValue2: 12.34),
    ChartData(x: '2009', yValue1: 1289128, yValue2: 15.34),*/

    ChartData(x: '2005', yValue1: 997281, yValue2: 997281),
    ChartData(x: '2006', yValue1: 1063599, yValue2: 1063599),
    ChartData(x: '2007', yValue1: 1063964, yValue2: 1063964),
    ChartData(x: '2008', yValue1: 1152123, yValue2: 1152123),
    ChartData(x: '2009', yValue1: 1289128, yValue2: 1289128),

    // ChartData(x: '2005', yValue1: 997281, yValue2: 997281, yValue3: 171741),
    // ChartData(x: '2006', yValue1: 1063599, yValue2: 1063599, yValue3: 139741),
    // ChartData(x: '2007', yValue1: 1063964, yValue2: 1063964, yValue3: 115741),
    // ChartData(x: '2008', yValue1: 1152123, yValue2: 1152123, yValue3: 127431),
    // ChartData(x: '2009', yValue1: 1289128, yValue2: 1289128, yValue3: 157141),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Multi Chart',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.amber,
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    axes: <ChartAxis>[
                      NumericAxis(
                        numberFormat: NumberFormat.compact(),
                        majorGridLines: const MajorGridLines(width: 0),
                        opposedPosition: true,
                        name: 'yAxis1',
                        interval: 1000,
                        minimum: 0,
                        maximum: 2500000,
                      ),
                    ],
                    series: <CartesianSeries<ChartData, String>>[
                      ColumnSeries<ChartData, String>(
                        animationDuration: 2000,
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.yValue1,
                        name: 'Unit Sold',
                        // xAxisName: 'qwerty',
                        // yAxisName: 'asdfg',
                        // yAxisName: 'yAxis2',
                      ),
                      LineSeries<ChartData, String>(
                          animationDuration: 4500,
                          animationDelay: 2000,
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.yValue2,
                          yAxisName: 'yAxis1',
                          markerSettings: MarkerSettings(isVisible: true),
                          name: 'Total Transaction'),
                    ]
                )
            )
          ]
      ),
    );
  }
}

class ChartData {
  ChartData({this.x, this.yValue1, this.yValue2});
  final String? x;
  final double? yValue1;
  final double? yValue2;
}


/*class ChartData {
  ChartData({this.x, this.yValue1, this.yValue2, this.yValue3});
  final String? x;
  final double? yValue1;
  final double? yValue2;
  final double? yValue3;
}*/
