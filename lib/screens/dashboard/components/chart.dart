import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class Chart extends StatelessWidget {
  const Chart({

    required this.PieChartSectionDatas,
  }) ;

  final List<PieChartSectionData> PieChartSectionDatas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(PieChartData(
              startDegreeOffset: -90,
              centerSpaceRadius: 70,
              sectionsSpace: 0,
              sections: PieChartSectionDatas)),
          Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "29.1",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.grey.shade500),
                  ),
                  Text(
                    "of 128",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        !.copyWith(color: Colors.grey.shade500,height: 0.5),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
