import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../bloc/setting/push_notifications/push_notifications_provider.dart';
import '../../../model/push_notifications/push_notifications_response_model.dart';
import '../../../resource/loading.dart';

class PushNotificationsScreen extends StatelessWidget {
  static const routeName = '/setting_push_notifications';

  List<charts.Series<LinearSales, int>> seriesList;
  var series;
  final bool animate;

  PushNotificationsScreen({this.seriesList, this.animate});

  var line = [
      charts.MaterialPalette.blue.shadeDefault,
      charts.MaterialPalette.green.shadeDefault,
      charts.MaterialPalette.red.shadeDefault,
      charts.MaterialPalette.yellow.shadeDefault,
      charts.MaterialPalette.teal.shadeDefault,
      charts.MaterialPalette.cyan.shadeDefault,
      charts.MaterialPalette.indigo.shadeDefault,
      charts.MaterialPalette.deepOrange.shadeDefault,
      charts.MaterialPalette.black,
    ];
    var area = [
      charts.MaterialPalette.blue.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.green.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.red.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.yellow.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.teal.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.cyan.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.indigo.shadeDefault.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter,
      charts.MaterialPalette.deepOrange.shadeDefault.lighter.lighter.lighter
          .lighter.lighter.lighter.lighter.lighter,
          charts.MaterialPalette.black.lighter.lighter.lighter.lighter.lighter
          .lighter.lighter.lighter,
    ];
    var color = [
      Colors.green, 
      Colors.blue, 
      Colors.yellow, 
      Colors.pink, 
      Colors.purple, 
      Colors.orange, 
      Colors.grey, 
      Colors.cyan
    ];

  @override
  Widget build(BuildContext context) {
    PushNotificationsBloc bloc = PushNotificationsProvider.of(context);
    bloc.getPushNotifications();

    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: buildBody(context, bloc),
    );
  }

  Widget buildBody(BuildContext context, PushNotificationsBloc bloc) {
    return StreamBuilder(
      stream: bloc.pushNotifications,
      builder:
          (context, AsyncSnapshot<PushNotificationsResponseModel> snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Loading().gary(context);
        }

        seriesList = createSampleData(snapshot.data);

        return ListView(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.green[100],
              child: charts.LineChart(seriesList,
                  defaultRenderer: charts.LineRendererConfig(
                      includeArea: true, stacked: true),
                  animate: animate),
            ),
            for (var i = 0; i < snapshot.data.data.length; i++) pieChart(snapshot.data, i),
            Container(
              height: 300,
              color: Colors.pink[100],
              child: charts.LineChart(seriesList,
                  defaultRenderer: charts.LineRendererConfig(
                      includeArea: true, stacked: true),
                  animate: animate),
            ),
          ],
        );
      },
    );
  }


  List<charts.Series<LinearSales, int>> createSampleData( PushNotificationsResponseModel data) {
    List<LinearSales> temp = [];
    List<charts.Series<LinearSales, int>> temp2 =
        List<charts.Series<LinearSales, int>>();

    for (var i = 0; i < data.data.length; i++) {
      for (var j = 0; j < data.data[i].data.length; j++) {
        temp.add(
            LinearSales(data.data[i].data[j].year, data.data[i].data[j].sales));
        print('LinearSales(' +
            data.data[i].data[j].year.toString() +
            ', ' +
            data.data[i].data[j].sales.toString() +
            ')');
      }
      temp2.add(charts.Series<LinearSales, int>(
        id: data.data[i].title,
        colorFn: (_, __) => line[i],
        areaColorFn: (_, __) => area[i],
        domainFn: (LinearSales data, _) => data.year,
        measureFn: (LinearSales data, _) => data.sales,
        data: temp,
      ));
      temp =[]; // kalau tidak ini akan terjadi seni yang luar biasa, jangan coba-coba
      print('');
    }

    return temp2;
  }

  Widget pieChart(PushNotificationsResponseModel data, int index){
    
    List<LinearSales> temp = [];
    List<charts.Series<LinearSales, int>> temp2 = List<charts.Series<LinearSales, int>>();

      for (var j = 0; j < data.data[index].data.length; j++) {
        temp.add(LinearSales(data.data[index].data[j].year, data.data[index].data[j].sales));
      }

      temp2.add(
        charts.Series<LinearSales, int>(
          id: 'Sales',
          colorFn: (_, __) => line[index],
          areaColorFn: (_, __) => area[index],
          domainFn: (LinearSales data, _) => data.year,
          measureFn: (LinearSales data, _) => data.sales,
          data: temp,
          labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
        )
      );
      
      return Card(
        child: Container(
          width: 50,
          height: 100,
          color: color[index],
          child: charts.PieChart(
            temp2,
            animate: animate,
            defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 60,
              arcRendererDecorators: [new charts.ArcLabelDecorator()],),),
        ),
      );
  }



}

class LinearSales {
  final int year;
  final int sales;
  LinearSales(this.year, this.sales);
}

// https://google.github.io/charts/flutter/example/line_charts/stacked_area_custom_color
