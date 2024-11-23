import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/card_details.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/icon_container.dart';

class WalletCardWithBalance extends StatelessWidget {
  final String availableBalance;

  const WalletCardWithBalance({Key? key, required this.availableBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSizer(150, context),
      width: widthSizer(327, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primaryColor, Color(0xFFC80AFB)])),
      child: Stack(children: [
        Positioned(
            bottom: 0,
            child: Container(
                width: widthSizer(327, context),
                height: heightSizer(150, context),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/purple_and_yellow_bg_design_with_white_lines.png'))))),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Available Balance',
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: heightSizer(12, context)),
              Text(
                '#$availableBalance',
                style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(32, context)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class UserCreditCard extends StatelessWidget {
  final CardDetails card;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const UserCreditCard(
      {Key? key,
      required this.card,
      required this.buttonText,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSizer(150, context),
      width: widthSizer(327, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.bgColor,
      ),
      child: Stack(children: [
        Positioned(
            bottom: 0,
            child: Container(
                width: widthSizer(327, context),
                height: heightSizer(150, context),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/purple_and_yellow_bg_design_with_purple_lines.png'))))),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logos_mastercard_small.png',
                      fit: BoxFit.scaleDown,
                    ),
                    GeneralButton(
                        height: heightSizer(40, context),
                        width: widthSizer(100, context),
                        padding: EdgeInsets.zero,
                        textFontSize: widthSizer(12, context),
                        buttonText: buttonText,
                        onPressed: onButtonPressed)
                  ],
                ),
                SizedBox(height: heightSizer(24, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Card Name',
                        style: AppTextStyles.heading4(context).copyWith(
                            fontSize: widthSizer(16, context),
                            color: AppColors.textBlack)),
                    Text(card.cardName,
                        style: AppTextStyles.mediumBodyText(context)
                            .copyWith(color: AppColors.textBlack)),
                  ],
                ),
                SizedBox(height: heightSizer(16, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Card Number',
                        style: AppTextStyles.heading4(context).copyWith(
                            fontSize: widthSizer(16, context),
                            color: AppColors.textBlack)),
                    Text(card.cardNumber,
                        style: AppTextStyles.mediumBodyText(context)
                            .copyWith(color: const Color(0xFF333333)))
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class SelectedWalletCard extends StatelessWidget {
  final CardDetails card;

  const SelectedWalletCard({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widthSizer(8, context)),
      height: heightSizer(72, context),
      width: widthSizer(327, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.bgColor),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logos_mastercard_small.png',
              fit: BoxFit.scaleDown,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(card.cardName,
                    style: TextStyle(
                      fontSize: widthSizer(16, context),
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: heightSizer(6, context)),
                Text(card.cardNumber,
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack))
              ],
            ),
            GeneralButton(
              padding: EdgeInsets.zero,
              width: widthSizer(100, context),
              height: heightSizer(40, context),
              textFontSize: widthSizer(14, context),
              textFontWeight: FontWeight.w400,
              buttonText: 'Change Card',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
    );
  }
}

class FundWalletCard extends StatelessWidget {
  final String availableBalance;

  const FundWalletCard({Key? key, required this.availableBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: heightSizer(200, context),
      width: widthSizer(327, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primaryColor, Color(0xFFC80AFB)])),
      child: Stack(children: [
        Positioned(
            bottom: 0,
            child: Container(
                width: widthSizer(327, context),
                height: heightSizer(150, context),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/purple_and_yellow_bg_design_with_white_lines.png'))))),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: heightSizer(40, context)),
              Text(
                'Available Balance',
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: heightSizer(12, context)),
              Text(
                '#$availableBalance',
                style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(32, context)),
              ),
              SizedBox(height: heightSizer(18, context)),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFC192FF),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(
                    horizontal: widthSizer(11, context),
                    vertical: heightSizer(8, context)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconContainer(
                      width: widthSizer(40, context),
                      child: const Icon(
                        IWishIcons.fluent_arrow_download_16_regular,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: widthSizer(6, context)),
                    Text(
                      'Fund Wallet',
                      style: AppTextStyles.smallBodyText(context)
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: heightSizer(12, context)),
            ],
          ),
        ),
      ]),
    );
  }
}

class EmailCard extends StatelessWidget {
  const EmailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.bgColor),
      padding: EdgeInsets.symmetric(
          vertical: heightSizer(12, context),
          horizontal: widthSizer(24, context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            IWishIcons.fluent_person_circle_24_regular,
            color: AppColors.lightPurple,
            size: widthSizer(40, context),
          ),
          SizedBox(width: widthSizer(12, context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Unuefe Ejoke',
                  style: AppTextStyles.heading4(context)
                      .copyWith(color: AppColors.textBlack)),
              SizedBox(height: heightSizer(3, context)),
              Text('rukevwe@gmail.com',
                  style: AppTextStyles.smallBodyText(context)
                      .copyWith(color: AppColors.textBlack))
            ],
          )
        ],
      ),
    );
  }
}
