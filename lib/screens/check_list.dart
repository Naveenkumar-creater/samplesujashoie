import 'package:flutter/material.dart';
import 'package:sujashoei/constants/font_registry.dart';
class CheckList extends StatelessWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Headings(heading: 'Check List',),),);
  }
}
