import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei'
    '/models/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sujashoei/responsive.dart';

class MyFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size ;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Files',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey.shade500),
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding)),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add New'),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),

        Responsive(
          mobile: MyFilesGridViewCard(crossAxisCount: _size.width<650?2:4,childAspectRatio: 1.1),
          tablet: MyFilesGridViewCard(crossAxisCount: 4,childAspectRatio: 1.1,),
          desktop: MyFilesGridViewCard(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            crossAxisCount: 4,
          ),
        ),
      ],
    );
  }
}

class MyFilesGridViewCard extends StatelessWidget {
 double? childAspectRatio = 1;
   int? crossAxisCount = 4;
   MyFilesGridViewCard({
     this.crossAxisCount,
     this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: demoMyFiels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding,
          crossAxisCount: crossAxisCount!,
          childAspectRatio: childAspectRatio!),
      itemBuilder: (context, index) => ProfileInfoCard(
        info: demoMyFiels[index],
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    required this.info,
  });
  final CloudStorageInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: info.color.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset(
                  info.svgSrc,
                  color: info.color,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey.shade500,
              )
            ],
          ),
          Text(
            info.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade500),
          ),
          ProgressLine(info: info),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiels} Files",
                style: TextStyle(color: Colors.grey.shade500),
              ),
              Text(
                info.totalStorage,
                style: TextStyle(color: Colors.grey.shade500),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    required this.info,
  });

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 5,
        decoration: BoxDecoration(
            color: info.color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      LayoutBuilder(
          builder: (context, index) => Container(
                width: index.maxWidth * (info.percentage / 100),
                height: 5,
                decoration: BoxDecoration(
                    color: info.color,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ))
    ]);
  }
}
