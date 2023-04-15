// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, annotate_overrides, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class DataType {
  String productName = "";
  Color productColor = Colors.blue;
  int count = 0;
  DataType(this.productName, this.count, this.productColor);
}

class HackData {
  String date = "";
  double amount = 0.0;
  HackData(this.date, this.amount);
}

class _ChartScreenState extends State<ChartScreen> {
  String chart_type = "line";

  var hacksData = <HackData>[
    HackData('04/03', 35000),
    HackData('04/02', 28000),
    HackData('04/01', 34000),
    HackData('03/31', 32000),
    HackData('03/30', 40000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veri Grafikleri'),
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  chart_type = 'line';
                  setState(() {});
                },
                child: Text('Line'),
              ),
              ElevatedButton(
                onPressed: () {
                  chart_type = 'spline';
                  setState(() {});
                },
                child: Text('Spline'),
              ),
              ElevatedButton(
                onPressed: () {
                  chart_type = 'pie';
                  setState(() {});
                },
                child: Text('Pie'),
              ),
            ],
          ),
          chart_type == 'line'
              ? LineChart(
                  data: hacksData,
                )
              : chart_type == 'spline'
                  ? SplineChart(data: hacksData)
                  : chart_type == 'pie'
                      ? PieChart()
                      : Text('not  implemented Yet'),
        ],
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  PieChart({
    super.key,
  });

  List<DataType> data = [
    DataType("Kişisel Bilgiler", 45000, Colors.brown),
    DataType("İletişim Bilgileri", 30000, Colors.blue),
    DataType("Hesap Bilgileri", 45000, Colors.orange),
    DataType("Diğer Bilgiler", 25000, Colors.green),
    DataType("Haftalık Sex Skoru", 10000, Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Hacklenen Veri Türleri'),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CircularSeries>[
        // Render pie chart
        PieSeries<DataType, String>(
            dataSource: data,
            pointColorMapper: (DataType data, _) => data.productColor,
            xValueMapper: (DataType data, _) => data.productName,
            yValueMapper: (DataType data, _) => data.count)
      ],
    );
  }
}

class LineChart extends StatelessWidget {
  List<HackData> data;

  LineChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // Initialize category axis
      primaryXAxis: CategoryAxis(),

      title: ChartTitle(
        text: 'Aylık Hacklenen Firmalar',
        alignment: ChartAlignment.center,
      ),
      // Enable legend
      legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <LineSeries<HackData, String>>[
        LineSeries<HackData, String>(
          name: 'Hacklenen Firmalar',
          // dataLabelSettings: DataLabelSettings(isVisible: true),
          // Bind data source
          dataSource: data,
          xValueMapper: (HackData hack, _) => hack.date,
          yValueMapper: (HackData hack, _) => hack.amount,
        ),
        LineSeries<HackData, String>(
          name: 'Güvenli Firmalar',
          //dataLabelSettings: DataLabelSettings(isVisible: true),
          // Bind data source
          dataSource: <HackData>[
            HackData('04/03', 10000),
            HackData('04/02', 17000),
            HackData('04/01', 11000),
            HackData('03/31', 13000),
            HackData('03/30', 5000)
          ],
          xValueMapper: (HackData hack, _) => hack.date,
          yValueMapper: (HackData hack, _) => hack.amount,
        ),
      ],
    );
  }
}

class SplineChart extends StatelessWidget {
  List<HackData> data;

  SplineChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        // Renders spline chart
        SplineSeries<HackData, String>(
            dataSource: data,
            markerSettings: MarkerSettings(isVisible: true),
            name: 'Hacklenen Firmalar',
            // Type of spline
            splineType: SplineType.natural,
            //dashArray: <double>[10, 10],
            xValueMapper: (HackData data, _) => data.date,
            yValueMapper: (HackData data, _) => data.amount),
        SplineSeries<HackData, String>(
            name: 'Güvenli Firmalar',
            markerSettings: MarkerSettings(isVisible: true),
            dataSource: [
              HackData('04/03', 10000),
              HackData('04/02', 17000),
              HackData('04/01', 11000),
              HackData('03/31', 13000),
              HackData('03/30', 5000)
            ],
            // Type of spline
            splineType: SplineType.natural,
            //dashArray: <double>[10, 10],
            xValueMapper: (HackData data, _) => data.date,
            yValueMapper: (HackData data, _) => data.amount)
      ],
    );
  }
}
