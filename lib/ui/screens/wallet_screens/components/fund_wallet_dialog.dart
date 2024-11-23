import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/icon_container.dart';

class FundWalletDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: const Color(0xFF4F4F4F).withOpacity(0.5),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const FundWalletDialog._();
        });
  }

  const FundWalletDialog._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
      elevation: 0,
      backgroundColor: const Color(0xFF4F4F4F).withOpacity(0.5),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        width: widthSizer(327, context),
        height: heightSizer(367, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFAEAEAE).withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8))
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSizer(14, context),
                  right: widthSizer(11, context)),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: IconContainer(
                  width: widthSizer(40, context),
                  child: const Icon(
                    IWishIcons.carbon_close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: heightSizer(48, context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(27, context)),
            child: Text(
              'How Would you like to fund your wallet',
              style: AppTextStyles.heading3(context)
                  .copyWith(color: AppColors.textBlack),
            ),
          ),
          SizedBox(height: heightSizer(24, context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: widthSizer(130, context),
                      height: heightSizer(86, context),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.availableCardsScreen);
                        },
                        child: Image.asset(
                          'assets/images/fund-using-card-image.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(height: heightSizer(12, context)),
                    Text('Using Card',
                        style: AppTextStyles.mediumBodyText(context)
                            .copyWith(color: AppColors.textBlack))
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: widthSizer(130, context),
                      height: heightSizer(86, context),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.fundByTransferScreen);
                        },
                        child: Image.asset(
                          'assets/images/bank-transfer-image.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(height: heightSizer(12, context)),
                    Text('Bank Transfer',
                        style: AppTextStyles.mediumBodyText(context)
                            .copyWith(color: AppColors.textBlack))
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
