import 'package:flutter/cupertino.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/widget_size_utils.dart';

/// Displays just the logo, name and obscured card number
class CreditCardCutOut extends StatelessWidget {
  const CreditCardCutOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: widthSizer(18, context), right: widthSizer(18, context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFE5E0E9)),
      padding: EdgeInsets.symmetric(
          vertical: heightSizer(16, context),
          horizontal: widthSizer(8, context)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logos_mastercard.png',
            fit: BoxFit.scaleDown,
          ),
          SizedBox(width: widthSizer(24, context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Unuefe Ejoke',
                  style: TextStyle(
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w700,
                      fontSize: widthSizer(16, context))),
              SizedBox(height: heightSizer(6, context)),
              Text('xxxx xxxx xxxx 1234',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: const Color(0xFF333333)))
            ],
          )
        ],
      ),
    );
  }
}
