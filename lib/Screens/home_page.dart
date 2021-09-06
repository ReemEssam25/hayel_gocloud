import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hayel_gocloud/widgets/container_donughtChart.dart';
import 'package:hayel_gocloud/widgets/customContainer_HomePage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      new ChartData("Not Attended", 100, Color(0xFF181B4C)),
      new ChartData("Attended", 1, Colors.lightGreen)
    ];

    final List<ChartData> chartData2 = [
      new ChartData("Not Attended", 100, Color(0xFF181B4C)),
      new ChartData("Attended", 1, Colors.white)
    ];
    return Column(
      children: [
        CustomContainer_HomePage(
          title: "Attendees Today",
          count: "0",
        ),
        CustomContainer_HomePage(
          title: "Attendees Yesterday",
          count: "0",
        ),
        CustomContainer_HomePage(
          title: "Present Now",
          count: "0",
        ),
        Container_DonughtChart(
          chartData2: chartData2,
          chartData: chartData,
          header: "Attendees Today",
        ),
        Container_DonughtChart(
          chartData2: chartData2,
          chartData: chartData,
          header: "Attendees Yesterday",
        ),
      ],
    );
  }
}
