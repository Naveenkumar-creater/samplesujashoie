import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sujashoei/constants/font_registry.dart';
import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/screens/check_list.dart';

class QrScanner extends StatefulWidget {
  QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          defaultPadding,
        ),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Headings(heading: 'Place the camera in QR code'),
                Headings(
                  text: 'for Scanning',
                )
              ],
            )),
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    MobileScanner(
                        onDetect: (BarcodeCapture barcodes) {
                      var barcode;
                      String code = barcode.rawValue ?? '---';
                      if (!isScanCompleted) {
                        isScanCompleted = true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckList()));
                      }
                    }),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: defaultPadding * 2,
                    ),
                    Headings(
                      subHeading: 'Functionality comes ',
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

