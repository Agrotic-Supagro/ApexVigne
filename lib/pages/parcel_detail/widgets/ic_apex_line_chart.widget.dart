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
            DateTime.parse(session.sessionAt).millisecondsSinceEpoch.toDouble(),
            calculateIcApex(session.apexFullGrowth, session.apexSlowerGrowth, session.apexStuntedGrowth)))
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
        minX: DateTime.parse(sessions.first.sessionAt)
            .add(const Duration(days: 1))
            .millisecondsSinceEpoch
            .toDouble(),
        maxX: DateTime.parse(sessions.last.sessionAt)
            .add(const Duration(days: -1))
            .millisecondsSinceEpoch
            .toDouble(),
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

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  DateTime.fromMillisecondsSinceEpoch(value.toInt())
                      .toString()
                      .substring(5, 10),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
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
