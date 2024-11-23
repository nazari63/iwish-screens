import 'package:flutter/material.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/payment_method_form.dart';
import '../components/grant_request_successful_dialog.dart';

class GrantRequestPaymentScreen extends StatelessWidget {
  const GrantRequestPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: heightSizer(10, context)),
            Text('Grant Request', style: AppTextStyles.heading2(context)),
            SizedBox(height: heightSizer(28, context)),
            PaymentMethodForm(
              buttonText: 'Pay NGN500.00',
              onFormSubmitted: () {
                GrantRequestSuccessfulDialog.show(context,
                    paymentType: GrantRequestPaymentType.card);
              },
            ),
            SizedBox(height: heightSizer(20, context)),
          ]),
        ),
      ),
    );
  }
}
