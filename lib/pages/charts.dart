import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
  class charts extends StatefulWidget {
  @override
  State<charts> createState() => _chartsState();
  }

class _chartsState extends State<charts> {
  late List<Data> _data;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState(){
    _data= getdata();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
}
    @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( backgroundColor: Colors.cyan,
        title: Center(child: Text("Probabilities",style: TextStyle(color: Colors.blueGrey[150]),))),
      body:SfCircularChart(
        title: ChartTitle(text: "Birds and their sizes in \n (in percentile-(%))"),
        legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series:<CircularSeries>[
        DoughnutSeries<Data,String>(
          dataSource: _data,
          xValueMapper: (Data data,_) => data.birdname,
          yValueMapper: (Data data,_) => data.percentage,
          dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            //maximumValue: 65
        )
      ],),
    ));
    throw UnimplementedError();
  }
  List<Data> getdata(){
    final List<Data> chartdata = [
      Data('kingfisher',15),
      Data('pegion',30),
      Data('sparrow',15),
      Data('eagle',40)
    ];
    return chartdata;
  }
}

class Data {
    final String birdname;
    final int percentage;
  Data(this.birdname,this.percentage);



}
