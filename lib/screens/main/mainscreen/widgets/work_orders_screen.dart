import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../constants/font_registry.dart';
import '../../../../constants/global_variables.dart';
import '../../../scanner/qr_scanner.dart';
import '../../components/work_order_grid.dart';

class WorkOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Headings(
              heading: 'Work Orders Status',
            ),
            WorkOrdersGridView(),
            SizedBox(
              height: defaultPadding,
            ),
            Headings(
              subHeading: 'Scan QR',
            ),
            SizedBox(height: defaultPadding * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrScanner(),
                        ));
                  },
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Lottie.asset('animations/5427-scan-qr-code.json'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
