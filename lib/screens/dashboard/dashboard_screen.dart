import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/responsive.dart';
import 'package:sujashoei/screens/dashboard/components/header.dart';
import 'package:sujashoei/screens/dashboard/components/my_files.dart';
import 'package:sujashoei/screens/dashboard/components/storage_details.dart';
import 'package:sujashoei/screens/dashboard/components/storage_info_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sujashoei/constants/global_variables.dart';
import 'components/chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> PieChartSectionDatas = [
      PieChartSectionData(
          color: Colors.red, value: 25, radius: 25, showTitle: false),
      PieChartSectionData(
          color: Colors.blue, value: 20, radius: 21, showTitle: false),
      PieChartSectionData(
          color: Colors.green, value:
      15, radius: 19, showTitle: false),
      PieChartSectionData(
          color: Colors.yellow, value: 12, radius: 18, showTitle: false),
      PieChartSectionData(
          color: Colors.deepPurpleAccent,
          value: 8,
          radius: 15,
          showTitle: false)
    ];
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Container(
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Files',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey.shade500),
                              ),
                              SizedBox(width: double.infinity,
                                child: DataTable(columns: [
                                  DataColumn(label: Text('File Name',style: TextStyle(color: Colors.grey.shade500),)),
                                  DataColumn(label: Text('Date',style: TextStyle(color: Colors.grey.shade500),)),
                                  DataColumn(label: Text('Size',style: TextStyle(color: Colors.grey.shade500),))
                                ], rows:[]),
                              ),
                               ],
                        ),
                        ),
                        if(Responsive.isMobile(context))SizedBox(
                          height: defaultPadding,
                        ),
                        if(Responsive.isMobile(context))StorageDetails(
                            PieChartSectionDatas: PieChartSectionDatas) ],
                    ),
                  )),
              if(!Responsive.isMobile(context))SizedBox(
                width: defaultPadding,
              ),
              if(!Responsive.isMobile(context))Expanded(
                  flex: 2,
                  child: StorageDetails(
                      PieChartSectionDatas: PieChartSectionDatas))
            ],
          )
        ],
      ),
    ));
  }
}
