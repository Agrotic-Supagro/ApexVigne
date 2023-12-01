import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IcApexLineChart extends StatelessWidget {
  final List<Session> sessions;

  const IcApexLineChart({
    Key? key,
    required this.sessions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = sessions
        .map((session) => FlSpot(
            DateTime.parse(session.sessionDate).millisecondsSinceEpoch.toDouble(),
            calculateIcApex(
                int.parse(session.apex0),
                int.parse(session.apex1),
                int.parse(session.apex2))))
        .toList();

    return LineChart(
      LineChartData(
        titlesData: titlesData,
        gridData: const FlGridData(
          horizontalInterval: 0.15,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minY: 0,
        maxY: 1,
        minX: DateTime.parse(sessions.first.sessionDate).add(const Duration(days: 1)).millisecondsSinceEpoch.toDouble(),
        maxX: DateTime.parse(sessions.last.sessionDate).add(const Duration(days: -1)).millisecondsSinceEpoch.toDouble(),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Theme.of(context).colorScheme.primary,
            barWidth: 2,
            isStrokeCapRound: true,
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Theme.of(context).colorScheme.primary,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                return LineTooltipItem(
                  touchedSpot.y.toStringAsFixed(2),
                  const TextStyle(color: Colors.white),
                );
              }).toList();
            },
          ),
        ),
      ),
      duration: const Duration(milliseconds: 250),
    );
  }

  //  Widget bottomTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 16,
  //   );

  //   Widget text;
  //   switch (value.toInt()) {
  //     case 2:
  //       text = const Text('Juin', style: style);
  //       break;
  //     case 7:
  //       text = const Text('Juil', style: style);
  //       break;
  //     case 12:
  //       text = const Text('Août', style: style);
  //       break;
  //     default:
  //       text = const Text('');
  //       break;
  //   }

  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     space: 10,
  //     child: text,
  //   );
  // }

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // {Widget Function(double, TitleMeta) getTitlesWidget = defaultGetTitle}
            getTitlesWidget: (value, meta) {
              // You can customize this to format your x-axis labels
              // For example, if data represents dates, you can convert index to date
              // Example: return DateFormat.MMM().format(DateTime.parse("2023-06-01")).substring(0, 3);
              return Text(
                // get DateFormat.dMM from millisecondsSinceEpoch
                DateTime.fromMillisecondsSinceEpoch(value.toInt())
                    .toString()
                    .substring(5, 10),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 0.5,
            reservedSize: 40,
          ),
        ),
      );
}

// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class SimpleLineChart extends StatelessWidget {
//   const SimpleLineChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       sampleData2,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   LineChartData get sampleData2 => LineChartData(
//         lineTouchData: lineTouchData2,
//         gridData: const FlGridData(show: false),
//         titlesData: titlesData2,
//         borderData: FlBorderData(
//           show: false,
//         ),
//         lineBarsData: lineBarsData2,
//         minX: 0,
//         maxX: 14,
//         maxY: 6,
//         minY: 0,
//       );

//   LineTouchData get lineTouchData2 => const LineTouchData(
//         enabled: false,
//       );

//   FlTitlesData get titlesData2 => FlTitlesData(
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 32,
//             interval: 1,
//             getTitlesWidget: bottomTitleWidgets,
//           ),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: leftTitles(),
//         ),
//       );

//   List<LineChartBarData> get lineBarsData2 => [
//         lineChartBarData2_1,
//         lineChartBarData2_2,
//         lineChartBarData2_3,
//       ];

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '1m';
//         break;
//       case 2:
//         text = '2m';
//         break;
//       case 3:
//         text = '3m';
//         break;
//       case 4:
//         text = '5m';
//         break;
//       case 5:
//         text = '6m';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.center);
//   }

//   SideTitles leftTitles() => SideTitles(
//         getTitlesWidget: leftTitleWidgets,
//         showTitles: true,
//         interval: 1,
//         reservedSize: 40,
//       );

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );

//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text = const Text('Juin', style: style);
//         break;
//       case 7:
//         text = const Text('Juil', style: style);
//         break;
//       case 12:
//         text = const Text('Août', style: style);
//         break;
//       default:
//         text = const Text('');
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 10,
//       child: text,
//     );
//   }

//   LineChartBarData get lineChartBarData1_1 => LineChartBarData(
//         isCurved: true,
//         color: Colors.greenAccent,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 1.5),
//           FlSpot(5, 1.4),
//           FlSpot(7, 3.4),
//           FlSpot(10, 2),
//           FlSpot(12, 2.2),
//           FlSpot(13, 1.8),
//         ],
//       );

//   LineChartBarData get lineChartBarData1_2 => LineChartBarData(
//         isCurved: true,
//         color: Colors.pinkAccent,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(
//           show: false,
//           color: Colors.pinkAccent.withOpacity(0.3),
//         ),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 2.8),
//           FlSpot(7, 1.2),
//           FlSpot(10, 2.8),
//           FlSpot(12, 2.6),
//           FlSpot(13, 3.9),
//         ],
//       );

//   LineChartBarData get lineChartBarData1_3 => LineChartBarData(
//         isCurved: true,
//         color: Colors.cyanAccent,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1, 2.8),
//           FlSpot(3, 1.9),
//           FlSpot(6, 3),
//           FlSpot(10, 1.3),
//           FlSpot(13, 2.5),
//         ],
//       );

//   LineChartBarData get lineChartBarData2_1 => LineChartBarData(
//         isCurved: true,
//         curveSmoothness: 0,
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 4),
//           FlSpot(5, 1.8),
//           FlSpot(7, 5),
//           FlSpot(10, 2),
//           FlSpot(12, 2.2),
//           FlSpot(13, 1.8),
//         ],
//       );

//   LineChartBarData get lineChartBarData2_2 => LineChartBarData(
//         isCurved: true,
//         color: Colors.pinkAccent.withOpacity(0.5),
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(
//           show: true,
//           color: Colors.pinkAccent.withOpacity(0.2),
//         ),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 2.8),
//           FlSpot(7, 1.2),
//           FlSpot(10, 2.8),
//           FlSpot(12, 2.6),
//           FlSpot(13, 3.9),
//         ],
//       );

//   LineChartBarData get lineChartBarData2_3 => LineChartBarData(
//         isCurved: true,
//         curveSmoothness: 0,
//         color: Colors.cyanAccent.withOpacity(0.5),
//         barWidth: 2,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: true),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1, 3.8),
//           FlSpot(3, 1.9),
//           FlSpot(6, 5),
//           FlSpot(10, 3.3),
//           FlSpot(13, 4.5),
//         ],
//       );
// }

// class LineChartSample1 extends StatefulWidget {
//   const LineChartSample1({super.key});

//   @override
//   State<StatefulWidget> createState() => LineChartSample1State();
// }

// class LineChartSample1State extends State<LineChartSample1> {
//   late bool isShowingMainData;

//   @override
//   void initState() {
//     super.initState();
//     isShowingMainData = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.23,
//       child: Stack(
//         children: <Widget>[
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 37,
//               ),
//               Text(
//                 'Monthly Sales',
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 37,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 16, left: 6),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.refresh,
//               color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
//             ),
//             onPressed: () {
//               setState(() {
//                 isShowingMainData = !isShowingMainData;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
