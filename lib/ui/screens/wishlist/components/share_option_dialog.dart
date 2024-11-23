import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/divider_with_or.dart';
import '../../../widgets/iWish_voucher_widget.dart';
import '../../../widgets/icon_container.dart';

class ShareOptionDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: const Color(0xFF000000).withOpacity(0.2),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const ShareOptionDialog._();
        });
  }

  const ShareOptionDialog._({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: widthSizer(12, context)),
      elevation: 0,
      backgroundColor: const Color(0xFF000000).withOpacity(0.2),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(12, context),
            horizontal: widthSizer(11, context)),
        height: heightSizer(424, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFAEAEAE).withOpacity(0.15),
                  blurRadius: 40,
                  offset: const Offset(0, 8))
            ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
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
              SizedBox(height: heightSizer(20, context)),
              Align(
                alignment: Alignment.center,
                child:
                    Text('Share Item', style: AppTextStyles.heading2(context)),
              ),
              SizedBox(height: heightSizer(24, context)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Copy the link below to share with friends',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack)),
              ),
              SizedBox(height: heightSizer(12, context)),
              TextFieldWithButton(
                readOnly: true,
                height: 50,
                hintText: 'https://iwish.ng/share/node-i',
                buttonText: 'Copy link',
                onTap: () {},
                buttonWidth: 91,
              ),
              SizedBox(height: heightSizer(24, context)),
              const DividerWithOr(),
              SizedBox(height: heightSizer(24, context)),
              Text('Share to', style: AppTextStyles.heading4(context)),
              SizedBox(height: heightSizer(12, context)),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => IconContainer(
                          width: 40,
                          backgroundColor: ShareOptionModel
                              .shareOptions[index].backgroundColor,
                          child: Icon(
                            ShareOptionModel.shareOptions[index].icon,
                            color:
                                ShareOptionModel.shareOptions[index].iconColor,
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(width: widthSizer(24, context)),
                    itemCount: ShareOptionModel.shareOptions.length),
              ),
              SizedBox(height: heightSizer(24, context)),
              Text('More sharing options',
                  style: AppTextStyles.heading4(context)
                      .copyWith(color: AppColors.primaryColor, fontSize: 16)),
            ]),
      ),
    );
  }
}

class ShareOptionModel {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  ShareOptionModel(
      {required this.icon,
      required this.iconColor,
      required this.backgroundColor});

  static List<ShareOptionModel> shareOptions = [
    whatsappShareOption,
    messengerShareOption,
    telegramShareOption,
    facebookShareOption,
    instagramShareOption
  ];

  static ShareOptionModel whatsappShareOption = ShareOptionModel(
      icon: IWishIcons.bxl_whatsapp,
      iconColor: const Color(0xFF25D366),
      backgroundColor: const Color(0xFFE9FBF0));

  static ShareOptionModel messengerShareOption = ShareOptionModel(
      icon: IWishIcons.bxl_messanger,
      iconColor: const Color(0xFF006AFF),
      backgroundColor: const Color(0xFFE5F0FF));

  static ShareOptionModel telegramShareOption = ShareOptionModel(
      icon: IWishIcons.bxl_telegram,
      iconColor: const Color(0xFF229ED9),
      backgroundColor: const Color(0xFFE5F0FF));

  static ShareOptionModel facebookShareOption = ShareOptionModel(
      icon: IWishIcons.bxl_facebook,
      iconColor: const Color(0xFF4267B2),
      backgroundColor: const Color(0xFFE9F6FC));

  static ShareOptionModel instagramShareOption = ShareOptionModel(
      icon: IWishIcons.carbon_logo_instagram,
      iconColor: const Color(0xFFC13584),
      backgroundColor: const Color(0xFFFAEBF3));
}
