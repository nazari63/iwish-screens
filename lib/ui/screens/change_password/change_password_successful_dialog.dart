import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/general_button.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../utils/widget_size_utils.dart';

class ChangePasswordSuccessfulDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.white70,
        barrierDismissible: false,
        builder: (context) {
          return const ChangePasswordSuccessfulDialog._();
        });
  }

  const ChangePasswordSuccessfulDialog._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white70,
      insetPadding: EdgeInsets.all(widthSizer(24, context)),
      child: Container(
        width: widthSizer(327, context),
        height: heightSizer(317, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x26AEAEAE),
                  blurRadius: 20,
                  offset: Offset(0, -8)),
              BoxShadow(
                  color: Color(0x26AEAEAE),
                  blurRadius: 20,
                  offset: Offset(0, 8))
            ]),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.green,
                  size: widthSizer(50, context),
                ),
                SizedBox(height: heightSizer(17, context)),
                Text(
                  'Change Successful',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: widthSizer(24, context)),
                ),
                SizedBox(height: heightSizer(17, context)),
                Text(
                  'Your Password has been changed\n Successfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widthSizer(14, context)),
                ),
                SizedBox(height: heightSizer(17, context)),
                GeneralButton(
                  buttonText: 'Done',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: widthSizer(140, context),
                  height: heightSizer(48, context),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                  'assets/images/purple_image_clip_for_dialog_bg_design.png')),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                  'assets/images/yellow_image_clip_for_dialog_bg_design.png'))
        ]),
      ),
    );
  }
}
