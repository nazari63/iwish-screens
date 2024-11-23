import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/icon_container.dart';

class CardAddedSuccessfullyDialog extends StatelessWidget {
  static show(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.white70,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const CardAddedSuccessfullyDialog._();
        });
  }

  const CardAddedSuccessfullyDialog._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.topCenter,
      backgroundColor: Colors.white70,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: heightSizer(84, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widthSizer(8, context)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFFAEAEAE).withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8))
            ]),
        child: Column(children: [
          Container(
              height: heightSizer(10, context),
              decoration: const BoxDecoration(
                color: AppColors.green,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
              height: heightSizer(62, context),
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Card added successfully', style: AppTextStyles.bodyText(context)),
                GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: IconContainer(width: widthSizer(24, context),
                    backgroundColor: AppColors.green,
                  child: const Icon(IWishIcons.carbon_close, color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
