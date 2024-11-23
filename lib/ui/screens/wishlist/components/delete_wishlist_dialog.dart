import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/icon_container.dart';

class DeleteWishlistDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: const Color(0xFF4F4F4F).withOpacity(0.5),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const DeleteWishlistDialog._();
        });
  }

  const DeleteWishlistDialog._({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: widthSizer(12, context)),
      elevation: 0,
      backgroundColor: const Color(0xFF4F4F4F).withOpacity(0.5),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(12, context),
            horizontal: widthSizer(11, context)),
        height: heightSizer(302, context),
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
                child: Text('Delete Wishlist',
                    style: AppTextStyles.heading2(context)),
              ),
              SizedBox(height: heightSizer(12, context)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Are you sure you want to delete this wishlist? This action can’t be undone',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: heightSizer(36, context)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GeneralButton(
                      width: widthSizer(140, context),
                      height: heightSizer(48, context),
                      buttonText: "No, I don’t",
                      onPressed: () {},
                      buttonColor: AppColors.grey,
                    ),
                    GeneralButton(
                      width: widthSizer(140, context),
                      height: heightSizer(48, context),
                      buttonText: 'Yes, I do',
                      onPressed: () {},
                      buttonColor: AppColors.red,
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
