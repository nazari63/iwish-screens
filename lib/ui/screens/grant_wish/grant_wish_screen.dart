import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../models/product.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/general_button.dart';
import 'components/select_grant_wish_mode_dialog.dart';
import 'grant_wish_model.dart';

class GrantWishScreen extends StatelessWidget {
  const GrantWishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text(
          'Grant Wish',
          style: AppTextStyles.heading4(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: heightSizer(36, context)),
          Text(
            'Ejoke’s gaming wishlist',
            style: AppTextStyles.heading2(context).copyWith(
                fontSize: widthSizer(24, context), color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(4, context)),
          Text(
            'This is where the description of the wishlist goes',
            style: AppTextStyles.mediumBodyText(context).copyWith(
                fontWeight: FontWeight.w400, color: AppColors.textBlack),
          ),
          SizedBox(height: heightSizer(24, context)),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => _GrantWishItem(
                    grantWishItem: GrantWishModel.grantWishItems[index],
                  ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: heightSizer(24, context)),
              itemCount: GrantWishModel.grantWishItems.length)
        ]),
      ),
    );
  }
}

class _GrantWishItem extends StatelessWidget {
  final Product grantWishItem;

  const _GrantWishItem({Key? key, required this.grantWishItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widthSizer(8, context),
          vertical: heightSizer(15, context)),
      decoration: BoxDecoration(
          color: AppColors.bgColor, borderRadius: BorderRadius.circular(8)),
      height: heightSizer(140, context),
      child: Row(
        children: [
          Container(
            width: widthSizer(110, context),
            height: heightSizer(110, context),
            decoration: BoxDecoration(
                // pending the time the image loads
                color: AppColors.lightPurple,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(grantWishItem.productImages[0])),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(width: widthSizer(12, context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                grantWishItem.name,
                style: AppTextStyles.heading4(context),
              ),
              SizedBox(height: heightSizer(24, context)),
              GeneralButton(
                buttonText: 'Grant Wish',
                onPressed: () {
                  SelectGrantWishModeDialog.show(context, grantWishItem);
                },
                width: widthSizer(125, context),
                height: heightSizer(40, context),
              )
            ],
          )
        ],
      ),
    );
  }
}
