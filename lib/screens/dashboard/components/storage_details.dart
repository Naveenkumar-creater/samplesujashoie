import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/screens/dashboard/components/chart.dart';
import 'package:sujashoei/screens/dashboard/components/storage_info_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({

    required this.PieChartSectionDatas,
  }) ;

  final List<PieChartSectionData> PieChartSectionDatas;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: secondaryColor,
      ),
      padding: EdgeInsets.all(defaultPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start  ,
        children: [
          Text(
            "Storage Details",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey.shade500),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(PieChartSectionDatas: PieChartSectionDatas),
          SizedBox(
            height: defaultPadding,
          ),
          StorageInfoCard(title:'Document Files' ,amountOfFiles:"1.3GB" ,noOfFiles:130 ,svgSrc:'assets/icons/Documents.svg' )
          ,StorageInfoCard(title:'Document Files' ,amountOfFiles:"1.3GB" ,noOfFiles:130 ,svgSrc:'assets/icons/Documents.svg' )
          ,StorageInfoCard(title:'Document Files' ,amountOfFiles:"1.3GB" ,noOfFiles:130 ,svgSrc:'assets/icons/Documents.svg' )
          ,StorageInfoCard(title:'Document Files' ,amountOfFiles:"1.3GB" ,noOfFiles:130 ,svgSrc:'assets/icons/Documents.svg' )
        ],
      ),
    );
  }
}
