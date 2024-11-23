import 'package:flutter/material.dart';

import '../../../../models/product.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/amount_selector.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/divider_with_or.dart';
import '../../../widgets/general_button.dart';

class SendCashEquivalentScreen extends StatefulWidget {
  final Product product;

  const SendCashEquivalentScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<SendCashEquivalentScreen> createState() =>
      _SendCashEquivalentScreenState();
}

class _SendCashEquivalentScreenState extends State<SendCashEquivalentScreen> {
  int? selectedSizeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text(
          'Send Money',
          style: AppTextStyles.heading4(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(21, context)),
        child: Column(
          children: [
            SizedBox(height: heightSizer(36, context)),
            Container(
              width: widthSizer(327, context),
              height: heightSizer(180, context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.product.productImages[0]),
                  ),
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(height: heightSizer(24, context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(widget.product.name,
                      style: AppTextStyles.heading3(context)),
                ),
                SizedBox(height: heightSizer(12, context)),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('See Product Description',
                          style: AppTextStyles.mediumBodyText(context)
                              .copyWith(color: AppColors.primaryColor)),
                      SizedBox(width: widthSizer(9, context)),
                      const Icon(
                        IWishIcons.arrow_down_circle,
                        size: 18,
                        color: AppColors.lightPurple,
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightSizer(40, context)),
                AmountSelector(
                  label: 'How much do you want to send?',
                  onAmountChanged: (_) {},
                ),
                SizedBox(height: heightSizer(24, context)),
                const DividerWithOr(),
                SizedBox(height: heightSizer(24, context)),
                _PercentageSelector(
                  onNewSizeSelected: (index) {
                    setState(() {
                      selectedSizeIndex = index;
                    });
                  },
                  selectedSizeIndex: selectedSizeIndex,
                  product: widget.product,
                ),
                SizedBox(height: heightSizer(48, context)),
                const CustomTextFieldWithLabel(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  label: 'Description (Optional)',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: heightSizer(72, context)),
                GeneralButton(
                  buttonText: 'Send Money',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouteNames.grantWishPaymentMethodScreen);
                  },
                )
              ],
            ),
            SizedBox(height: heightSizer(31, context)),
          ],
        ),
      ),
    );
  }
}

class _PercentageSelector extends StatelessWidget {
  const _PercentageSelector(
      {Key? key,
      required this.product,
      required this.onNewSizeSelected,
      required this.selectedSizeIndex})
      : super(key: key);

  final void Function(int) onNewSizeSelected;
  final dynamic selectedSizeIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSizer(38, context),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => onNewSizeSelected(index),
                child: Container(
                  width: widthSizer(57, context),
                  height: heightSizer(40, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xFF959494), width: 2),
                    color: index == selectedSizeIndex
                        ? const Color(0xFF959494)
                        : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                        '${(product.percentage[index] * 100).round().toString()}%',
                        style: AppTextStyles.bodyText(context).copyWith(
                            color: index == selectedSizeIndex
                                ? Colors.white
                                : const Color(0xFF333333))),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: widthSizer(12, context),
              ),
          itemCount: product.percentage.length),
    );
  }
}
