import 'package:sujashoei/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
     required this.title, required this.svgSrc, required this.amountOfFiles, required this.noOfFiles,
  }) ;
  final String title,svgSrc,amountOfFiles;
  final int noOfFiles;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),margin: EdgeInsets.only(top: defaultPadding),
      child: Row(
        children: [
          SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                svgSrc,color: primaryColor,)),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                      TextStyle(color: Colors.grey.shade500),
                    ),
                    Text('$noOfFiles Files',style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey.shade500))
                  ],
                ),
              )),
          Text(amountOfFiles,style:Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade500))],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: primaryColor.withOpacity(0.15)),
          borderRadius:
          BorderRadius.all(Radius.circular(10))),
    );
  }
}
