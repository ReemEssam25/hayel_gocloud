import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Container_DonughtChart extends StatelessWidget {
  const Container_DonughtChart(
      {Key key, this.chartData, this.chartData2, this.header})
      : super(key: key);

  final List<ChartData> chartData;
  final List<ChartData> chartData2;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  header,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
          Divider(
            thickness: 2,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                      innerRadius: '95%',
                      radius: '53%',
                      dataSource: chartData2,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ],
              ),
              SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                      innerRadius: '70%',
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ],
              ),
              Text(
                "Not Attended\n       100%",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
