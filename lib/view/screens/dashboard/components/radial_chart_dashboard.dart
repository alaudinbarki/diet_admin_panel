import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChartDashboard extends StatelessWidget {
  bool? fromMobile;
  RadialChartDashboard({this.fromMobile = false, super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Subscription', 35, yellowPrimary),
      ChartData('App Purchase', 50, greenPrimary),
      ChartData('Refund', 65, redPrimary),
    ];
    return SizedBox(
      width: fromMobile! ? MediaQuery.of(context).size.width : 255.webT(context),
      height: fromMobile! ? null : 255.webT(context),
      child: SfCircularChart(
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (ChartData data, _) => data.color,
            cornerStyle: CornerStyle.bothCurve,
            innerRadius: '50%',
            radius: '90%',
            gap: '15%',
            trackColor: borderColor,
          )
        ]
      )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
