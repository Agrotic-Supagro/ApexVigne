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
        .map(
          (session) => FlSpot(
            // transforme les dates de type "2024-01-13" en double 20240113.0
            double.parse(session.sessionAt.replaceAll("-", "")),
            calculateIcApex(session.apexFullGrowth, session.apexSlowerGrowth,
                session.apexStuntedGrowth),
          ),
        )
        .toList();

    return LineChart(
      LineChartData(
        titlesData: titlesData(spots),
        gridData:
            const FlGridData(horizontalInterval: 0.10, drawVerticalLine: false),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 200, 200, 200),
              width: 1,
            ),
            left: BorderSide(
              color: Color.fromARGB(255, 200, 200, 200),
              width: 1,
            ),
          ),
        ),
        minY: 0,
        maxY: 1,
        minX: spots.first.x,
        maxX: spots.last.x,
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

  FlTitlesData titlesData(List<FlSpot> spots) {
    List<double> spotsDates = spots.map((e) => e.x).toList();

    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1,
          getTitlesWidget: (value, meta) {
            String text = '';
            if (spotsDates.contains(value)) {
              text = formatGraphDate(value);
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
          interval: 0.1,
          reservedSize: 30,
        ),
      ),
    );
  }
}
