import 'package:flutter/material.dart';
import 'package:sujashoei/constants/global_variables.dart';
import 'package:sujashoei/responsive.dart';
import '../../../constants/font_registry.dart';

class WorkOrdersGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Responsive(
        mobile: ResponsiveGridCard(crossAxisCount:  _size.width < 650 ? 2: 4 , childAspectRatio: _size.width < 650 ? 1.1: 1, ),
        tablet: ResponsiveGridCard(crossAxisCount:  4 , childAspectRatio: _size.width <= 900 ? 1.3: 1, ),
        desktop: ResponsiveGridCard(crossAxisCount:  4 , childAspectRatio: _size.width < 1400 ? 1.1: 1.4, ));
  }
}

class ResponsiveGridCard extends StatelessWidget {
   int crossAxisCount = 4;
   double childAspectRatio = 1;
   ResponsiveGridCard({
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(defaultPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        // Customize content based on the container index
        if (index == 0) {
          return GridViewContent(
            label: 'High Priority Work Orders',
            icon: Icon(
              Icons.arrow_upward,
              color: Colors.red,
            ),
            count: '1',
          );
        } else if (index == 1) {
          return GridViewContent(
            label: 'Overdue Work Orders',
            count: '2',
            icon: Icon(
              Icons.lock_clock,
              color: Colors.red,
            ),
          );
        } else if (index == 2) {
          return GridViewContent(
            label: 'Request Pendings',
            count: '3',
            icon: Icon(
              Icons.download,
              color: Colors.orange,
            ),
          );
        } else if (index == 3) {
          return GridViewContent(
            label: 'Completed Task Today',
            count: '4',
            icon: Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            // Customize content for other containers
            // For example:
            // child: Center(
            //   child: Text('Container ${index + 1}'),
            // ),
          );
        }
      },
    );
  }
}

class GridViewContent extends StatelessWidget {
  final String label;
  final String count;
  final Icon icon;
  const GridViewContent(
      {super.key,
      required this.label,
      required this.count,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context, label);
      },
      child: Padding(padding: EdgeInsets.all(defaultPadding/2),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Headings(
                    subHeading: count,
                  )
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),
              Center(child: Headings(text: label)),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, String text) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      );
    },
  );
}
