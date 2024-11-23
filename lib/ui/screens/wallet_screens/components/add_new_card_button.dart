import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/general_button.dart';

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GeneralButton(
        borderColor: AppColors.primaryColor,
        buttonColor: Colors.white,
        textColor: AppColors.primaryColor,
        padding: EdgeInsets.zero,
        buttonText: 'Add New Card',
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.addNewCardScreen);
        },
        textFontSize: widthSizer(16, context),
        textFontWeight: FontWeight.w700,
        width: widthSizer(140, context),
        height: heightSizer(48, context),
      ),
    );
  }
}
