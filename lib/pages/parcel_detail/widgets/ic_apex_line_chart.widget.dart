import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:apex_vigne/utils/format_date.dart';
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
            sessions.indexOf(session).toDouble(),
            calculateIcApex(session.apexFullGrowth, session.apexSlowerGrowth,
                session.apexStuntedGrowth)))
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
        minX: 0,
        maxX: sessions.length.toDouble() - 1,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
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
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              String text = '';
              if (value == 0) {
                text = formatDate(sessions.first.sessionAt);
              } else if (value + 0.1 >= sessions.length - 1) {
                text = formatDate(sessions.last.sessionAt);
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                fitInside: const SideTitleFitInsideData(
                    enabled: true,
                    axisPosition: 1,
                    distanceFromEdge: 0,
                    parentAxisSize: 2),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
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
            reservedSize: 30,
          ),
        ),
      );
}
