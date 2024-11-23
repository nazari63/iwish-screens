import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/utils/router/route_names.dart';
import 'package:wish_list/utils/validators.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/service_locator.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/payment_method_form.dart';
import '../../../widgets/social_media_button.dart';
import 'checkout_viewmodel.dart';

class CheckOutScreen extends StatelessWidget {
  final bool forAnotherUser;
  const CheckOutScreen({Key? key, required this.forAnotherUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text('Checkout', style: AppTextStyles.heading2(context)),
          ),
          leadingWidth: widthSizer(100, context),
          leading: const CustomBackButton(
            padding: EdgeInsets.only(top: 32, left: 24),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ChangeNotifierProvider<CheckOutModel>.value(
            value: serviceLocator<CheckOutModel>(),
            child: Consumer<CheckOutModel>(
              builder: (context, model, child) {
                List formPages = [
                  _ContactInformationForm(forAnotherUser: forAnotherUser,),
                  _DeliveryInformationForm(forAnotherUser: forAnotherUser,),
                  PaymentMethodForm(
                    buttonText: 'Checkout',
                    onFormSubmitted: () {
                      model.checkout(context);
                    },
                  )
                ];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const _CurrentFormIndicator(),
                    SizedBox(height: heightSizer(24, context)),
                    formPages[model.currentPage],
                  ],
                );
              },
            ),
          ),
        ));
  }
}

class _CurrentFormIndicator extends StatelessWidget {
  const _CurrentFormIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutModel>(builder: (context, model, child) {
      return SizedBox(
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      /// We only allow the user to go backwards
                      if (index < model.currentPage) {
                        model.goToPage(index);
                      }
                    },
                    child: Container(
                      width: widthSizer(40, context),
                      height: widthSizer(40, context),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: model.currentPage >= index
                              ? AppColors.lightPurple
                              : const Color(0xFFDCC1FF)),
                      child: Center(
                          child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: widthSizer(16, context),
                            color: Colors.white),
                      )),
                    ),
                  ),
              separatorBuilder: (BuildContext context, int index) {
                return Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: widthSizer(100, context),
                        child: Divider(
                          thickness: 3,
                          color: model.currentPage > index
                              ? AppColors.lightPurple
                              : const Color(0xFFABAAAA),
                        )));
              },
              itemCount: 3),
        ),
      );
    });
  }
}

class _ContactInformationForm extends StatefulWidget {
  final bool forAnotherUser;
  const _ContactInformationForm({Key? key, required this.forAnotherUser}) : super(key: key);

  @override
  State<_ContactInformationForm> createState() => _ContactInformationFormState();
}

class _ContactInformationFormState extends State<_ContactInformationForm> {
  bool saveDetails = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutModel>(builder: (context, viewModel, child) {
      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.forAnotherUser? 'Recipient ':''}Contact Information',
              style: AppTextStyles.heading3(context),
            ),
            SizedBox(height: heightSizer(24, context)),
            const CustomTextFieldWithLabel(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'Name',
              keyboardType: TextInputType.name,
              validator: Validators.isNotEmpty,
            ),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: "Email ${widget.forAnotherUser? '(Optional)':''}",
              keyboardType: TextInputType.emailAddress,
              validator: Validators.isEmail,
            ),
            SizedBox(height: heightSizer(24, context)),
            CustomTextFieldWithLabel(
              label: 'Mobile Number${widget.forAnotherUser? '' : '(Optional)'}',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  /// Optional value
                  return null;
                } else {
                  return Validators.isValidNumberAndLength(value);
                }
              },
            ),
            SizedBox(height: heightSizer(6, context)),
            Text(
              'Incase we need to contact you about your order',
              style: AppTextStyles.smallBodyText(context)
                  .copyWith(color: const Color(0xFF444444)),
            ),
            SizedBox(height: heightSizer(74, context)),
            Visibility(
              visible: widget.forAnotherUser,
              replacement: SizedBox(height: heightSizer(24, context),),
              child: Row(
                children: [
                  Checkbox(
                    side:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    value: saveDetails,
                    onChanged: (value) {
                      setState(() {
                        saveDetails = value!;
                      });
                    },
                  ),
                  SizedBox(width: widthSizer(8, context)),
                  Text('Save information for future purchase',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context),
                          color: const Color(0xFF333333))),
                ],
              ),
            ),

            SizedBox(height: heightSizer(38, context)),
            GeneralButton(
              textFontWeight: FontWeight.w400,
              textFontSize: widthSizer(16, context),
              buttonText: 'Proceed',
              onPressed: () {
                viewModel.nextPage();
              },
            )
          ],
        ),
      );
    });
  }
}

class _DeliveryInformationForm extends StatefulWidget {
  final bool forAnotherUser;
  const _DeliveryInformationForm({Key? key, required this.forAnotherUser}) : super(key: key);

  @override
  State<_DeliveryInformationForm> createState() =>
      _DeliveryInformationFormState();
}

class _DeliveryInformationFormState extends State<_DeliveryInformationForm> {
  bool saveDetails = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckOutModel>(builder: (context, viewModel, child) {
      return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Information',
              style: AppTextStyles.heading3(context),
            ),
            SizedBox(height: heightSizer(24, context)),
            Text(
              'Delivery option',
              style: AppTextStyles.bodyText(context),
            ),
            SizedBox(height: heightSizer(12, context)),
            const _DoorstepButton(),
            SizedBox(height: heightSizer(37, context)),
            Text(
              'Estimated Delivery Day',
              style: AppTextStyles.heading4(context),
            ),
            SizedBox(height: heightSizer(12, context)),
            Text('Your order is estimated to arrive in 5 working days',
                style: AppTextStyles.mediumBodyText(context)),
            SizedBox(height: heightSizer(22, context)),
            const CustomTextFieldWithLabel(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'State',
              keyboardType: TextInputType.name,
              validator: Validators.isNotEmpty,
            ),
            SizedBox(width: widthSizer(24, context)),
            const CustomTextFieldWithLabel(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'Zip Code',
              keyboardType: TextInputType.number,
              validator: Validators.isValidNumber,
            ),
            SizedBox(height: heightSizer(24, context)),
            const CustomTextFieldWithLabel(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              label: 'Delivery Address',
              keyboardType: TextInputType.name,
              validator: Validators.isNotEmpty,
            ),
            SizedBox(height: heightSizer(18, context)),
            Visibility(
              visible: !widget.forAnotherUser,
              replacement: SizedBox(height: heightSizer(24, context),),
              child: Row(
                children: [
                  Checkbox(
                    side:
                        const BorderSide(width: 1, color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    value: saveDetails,
                    onChanged: (value) {
                      setState(() {
                        saveDetails = value!;
                      });
                    },
                  ),
                  SizedBox(width: widthSizer(8, context)),
                  Text('Save information for future purchase',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: widthSizer(14, context),
                          color: const Color(0xFF333333))),
                ],
              ),
            ),
            SizedBox(height: heightSizer(42, context)),
            GeneralButton(
              textFontWeight: FontWeight.w400,
              textFontSize: widthSizer(16, context),
              buttonText: 'Proceed',
              onPressed: () {
                viewModel.nextPage();
              },
            )
          ],
        ),
      );
    });
  }
}

class _DoorstepButton extends StatelessWidget {
  const _DoorstepButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SocialMediaButton(
        label: 'Doorstep',
        borderWidth: 2,
        fontWeight: FontWeight.w700,
        textColor: AppColors.primaryColor,
        childrenSpacing: 16,
        borderColor: AppColors.primaryColor,
        height: 54,
        icon: const Icon(
          IWishIcons.fluent_door_16_regular,
          color: AppColors.primaryColor,
          size: 20,
        ),
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.selectPickUpStation);
        });
  }
}
