import 'package:sujashoei/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/font_registry.dart';

class Header extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   "Dashboard",
        //   style: Theme.of(context).textTheme.headlineSmall.copyWith(color: Colors.grey.shade500),
        // ),
        Headings(heading: 'Dashboard', subHeading: '',),
        Spacer(
          flex: 2,
        ),
        Expanded(
            child: SearchField()),
        ProfileCard(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: defaultPadding / 2, horizontal: defaultPadding),
      margin: EdgeInsets.only(
        left: defaultPadding,
      ),
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2),
            child: Text(
              "Female Naveen",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: "search",hintStyle: TextStyle(color: Colors.grey.shade700),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: InkWell(
            onTap: () {},borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                margin: EdgeInsets.all(defaultPadding / 2),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                    BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset("assets/icons/Search.svg")),
          )),
    );
  }
}
