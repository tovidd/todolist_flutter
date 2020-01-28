import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PushNotificationsScreen extends StatelessWidget {
  final List<charts.Series<LinearSales, String>> seriesList;
  final bool animate;

  PushNotificationsScreen(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory PushNotificationsScreen.withSampleData() {
    return PushNotificationsScreen(
      createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the legend behavior to the chart to turn on legends.
      // This example shows how to optionally show measure and provide a custom
      // formatter.
      behaviors: [
        new charts.SeriesLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Set show measures to true to display measures in series legend,
          // when the datum is selected.
          showMeasures: true,
          // Optionally provide a measure formatter to format the measure value.
          // If none is specified the value is formatted as a decimal.
          measureFormatter: (num value) {
            return value == null ? '-' : '${value}k';
          },
        ),
      ],
    );
  }


  static List<charts.Series<LinearSales, String>> createSampleData() {
    final desktopSalesData = [
      new LinearSales('2014', 5),
      new LinearSales('2015', 25),
      new LinearSales('2016', 100),
      new LinearSales('2017', 75),
    ];

    final tabletSalesData = [
      new LinearSales('2014', 25),
      new LinearSales('2015', 50),
      // Purposely have a null data for 2016 to show the null value format.
      new LinearSales('2017', 20),
    ];

    final mobileSalesData = [
      new LinearSales('2014', 10),
      new LinearSales('2015', 15),
      new LinearSales('2016', 50),
      new LinearSales('2017', 45),
    ];

    final otherSalesData = [
      new LinearSales('2014', 20),
      new LinearSales('2015', 35),
      new LinearSales('2016', 15),
      new LinearSales('2017', 10),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        areaColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<LinearSales, String>(
        id: 'Tablet',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
      new charts.Series<LinearSales, String>(
        id: 'Mobile',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      new charts.Series<LinearSales, String>(
        id: 'Other',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: otherSalesData,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String year;
  final int sales;

  LinearSales(this.year, this.sales);
}
