import 'package:flutter/material.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/payment_method_form.dart';

class GrantWishPaymentMethodScreen extends StatelessWidget {
  const GrantWishPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text(
          'Checkout',
          style: AppTextStyles.heading4(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(
          children: [
            SizedBox(height: heightSizer(24, context)),
            PaymentMethodForm(
              forGrantWish: true,
              buttonText: 'Checkout',
              onFormSubmitted: () {
                Navigator.pushNamed(
                    context, RouteNames.grantWishPaymentSuccessfulScreen);
              },
            ),
            SizedBox(height: heightSizer(40, context)),
          ],
        ),
      ),
    );
  }
}
