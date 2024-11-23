import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_text_form_field.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/app_text_styles.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/widget_size_utils.dart';

double amount = 250000;

class AmountSelector extends StatefulWidget {
  final double width;
  final double height;
  final String label;
  final void Function(double) onAmountChanged;

  const AmountSelector(
      {Key? key,
      this.width = 250,
      this.height = 58,
      required this.onAmountChanged,
      required this.label})
      : super(key: key);

  @override
  State<AmountSelector> createState() => _AmountSelectorState();
}

class _AmountSelectorState extends State<AmountSelector> {
  final _amountController = MoneyMaskedTextController(
      initialValue: 0, decimalSeparator: '.', thousandSeparator: ',');

  double _parseAmount() {
    return double.parse(_amountController.text.replaceAll(",", ""));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            widget.label,
            style: AppTextStyles.bodyText(context)
                .copyWith(color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(12, context)),
          SizedBox(
              width: widthSizer(widget.width, context),
              height: heightSizer(widget.height, context),
              child: CustomTextFormField(
                controller: _amountController,
                fillColor: Colors.white,
                width: widthSizer(widget.width, context),
                keyboardType: TextInputType.number,
                textStyle: AppTextStyles.heading3(context)
                    .copyWith(color: AppColors.textBlack),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  widget.onAmountChanged(_parseAmount());
                },
                inputBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color(0xFF959494), width: 2),
                ),
                prefixIcon: _InCreaseDecreaseButton(
                    icon: IWishIcons.fluent_subtract_16_regular,
                    onPressed: () {
                      var amount = _parseAmount();
                      amount = amount - 1;
                      _amountController.text = amount.toString();
                    }),
                suffixIcon: _InCreaseDecreaseButton(
                    icon: IWishIcons.fluent_add_16_regular,
                    onPressed: () {
                      var amount = _parseAmount();
                      amount = amount + 1;
                      _amountController.text = amount.toString();
                    }),
              )),
        ],
      ),
    );
  }
}

class _InCreaseDecreaseButton extends StatelessWidget {
  const _InCreaseDecreaseButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  /// passing null, disables the button
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        visualDensity: VisualDensity.compact,
        disabledColor: AppColors.grey,
        color: AppColors.textBlack,
        icon: Icon(
          icon,
          size: 20,
        ));
  }
}
