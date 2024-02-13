// ignore_for_file: must_be_immutable

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:base_code/utils/colors.dart';

class LineChartWidget extends StatelessWidget {
  bool? fromMobile;
  LineChartWidget({this.fromMobile = false, Key? key}) : super(key: key);

  List<SalesData> androidData = [
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 40),
    SalesData('Jun', 50),
    SalesData('Jul', 63),
  ];

  List<SalesData> iosData = [
    SalesData('Jan', 25),
    SalesData('Feb', 45),
    SalesData('Mar', 23),
    SalesData('Apr', 55),
    SalesData('May', 66),
    SalesData('Jun', 44),
    SalesData('Jul', 78),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fromMobile! ? null : 385.webT(context),
      width:
          fromMobile! ? MediaQuery.of(context).size.width : 1120.webT(context),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        plotAreaBorderColor: borderColor,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          minorGridLines: const MinorGridLines(width: 0),
          axisLine: const AxisLine(color: Colors.transparent),
          majorTickLines: const MajorTickLines(
              size: 0), // Set size to 0 to hide major ticks
          minorTickLines: const MinorTickLines(
              size: 0), // Set size to 0 to hide minor ticks
          borderWidth: 0,
          borderColor: borderColor,
          labelStyle: TextStyle(
              color: textColor,
              fontSize: fromMobile!
                  ? 10
                  : 16.webT(context)), // Change text color for X-axis labels
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 20,
          majorTickLines: const MajorTickLines(size: 0),
          minorTickLines: const MinorTickLines(size: 0),
          majorGridLines: const MajorGridLines(width: 1, color: borderColor),
          minorGridLines: const MinorGridLines(width: 0),
          axisLine: const AxisLine(color: Colors.transparent),
          borderWidth: 0,
          borderColor: borderColor,
          labelStyle: TextStyle(
              color: textColor, fontSize: fromMobile! ? 10 : 16.webT(context)),
        ),
        title: ChartTitle(
            text: 'ABC', textStyle: const TextStyle(color: Colors.transparent)),
        legend: Legend(isVisible: false),
        tooltipBehavior: TooltipBehavior(enable: false),
        series: <CartesianSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
            dataSource: androidData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Android',
            color: androidLineColor,
            width: fromMobile! ? 3 / 2.h : 3.webT(context),
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            // markerSettings: MarkerSettings(isVisible: true, width: 12.webT(context), height: 12.webT(context)),
          ),
          LineSeries<SalesData, String>(
            dataSource: iosData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'iOS',
            color: iosLineColor,
            width: fromMobile! ? 3 / 2.h : 3.webT(context),
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            // markerSettings: MarkerSettings(isVisible: true, width: 12.webT(context), height: 12.webT(context)),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
