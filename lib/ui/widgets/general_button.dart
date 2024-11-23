import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class GeneralButton extends StatelessWidget {
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isEnabled;
  final double height;

  /// defaults to MediaQuery.of(context).size.width
  final double? width;
  final double? textFontSize;
  final FontWeight textFontWeight;
  final Alignment alignment;
  final List<BoxShadow>? boxShadow;

  // displays either a ElevatedButton or ElevatedButton.icon
  final Widget _child;

  GeneralButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.buttonColor = AppColors.primaryColor,
      this.textColor = Colors.white,
      this.height = 55,
      this.width,
      this.borderColor = Colors.transparent,
      this.padding,
      this.margin,
      this.isEnabled = true,
      this.textFontSize,
      this.textFontWeight = FontWeight.normal,
      this.alignment = Alignment.center,
      this.boxShadow})
      : _child = Text(
          buttonText,
          style: GoogleFonts.nunitoSans(
              color: textColor,
              fontWeight: textFontWeight,
              fontSize: textFontSize),
        ),
        super(key: key);

  GeneralButton.icon(
      {Key? key,
      required this.buttonText,
      required Widget icon,
      required this.onPressed,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.buttonColor = AppColors.primaryColor,
      this.textColor = Colors.white,
      this.height = 50,
      this.width,
      this.borderColor = Colors.transparent,
      this.padding,
      this.margin,

      /// spacing between the icon and the text
      double gap = 12,
      this.isEnabled = true,
      this.textFontSize,
      this.textFontWeight = FontWeight.normal,
      this.boxShadow,
      this.alignment = Alignment.center})
      : _child = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
                child: Text(
              buttonText,
              style: GoogleFonts.nunitoSans(
                  color: textColor,
                  fontWeight: textFontWeight,
                  fontSize: textFontSize),
            )),
            SizedBox(width: gap),
            icon
          ],
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width ?? deviceWidth,
        margin: margin,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: textColor,
              primary: buttonColor,
              padding: padding,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: BorderSide(color: borderColor),
              ),
              alignment: alignment),
          onPressed: isEnabled ? onPressed : null,
          child: _child,
        ));
  }
}
