import 'package:flutter/material.dart';
// This Headings widget that can display various combinations of heading, subheading, text, and subtext.
// It accepts nullable string parameters for each text component. The texts are conditionally displayed based on whether the
// corresponding parameter is not null. The widget uses different styles and colors for each text component to achieve visual
// differentiation. The font sizes and font weights can be adjusted as needed. Overall, this widget provides flexibility in
// displaying text components and allows for easy customization of their styles.
class Headings extends StatelessWidget {
  final String? heading;
  final String? subHeading;
  final String? text;
  final String? subText;

  const Headings({this.heading, this.subHeading, this.text, this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (heading != null)
          Text(
            heading!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        if (subHeading != null)
          Text(
            subHeading!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        if (text != null)
          Text(
            text!,
            style:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.black,fontSize:18),
          ),
        if (subText != null)
          Text(subText!,
              style: TextStyle(fontSize:16,fontWeight: FontWeight.bold, color: Colors.black))
      ],
    );
  }
}
