import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/icon_container.dart';
import '../../../widgets/info_card.dart';
import '../../../widgets/transaction_tile.dart';
import '../../wallet_screens/transaction_history/transaction_history_model.dart';

class VendorOverviewScreen extends StatelessWidget {
  const VendorOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: VendorBottomNav(
            currentNavParent: BottomNavParent.vendorOverview,
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: heightSizer(16, context)),
                      Text('Overview',
                          textAlign: TextAlign.start,
                          style: AppTextStyles.heading2(context)),
                      SizedBox(height: heightSizer(12, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _OrderAndDeliveryWidget(
                            backgroundColor: Color(0xFF080016),
                            title: 'Total Order',
                            count: 200,
                            iconContainerWidth: 29.64,
                            iconContainerHeight: 30,
                            icon: IWishIcons.fluent_cart_16_regular,
                            titleColor: Colors.white,
                            countTextColor: Color(0xFFFFCC00),
                            iconSize: 18,
                            dateTextColor: Colors.white,
                          ),
                          _OrderAndDeliveryWidget(
                            backgroundColor: Colors.white,
                            title: 'Total Delivery',
                            count: 150,
                            iconContainerWidth: 33,
                            iconContainerHeight: 28.5,
                            icon: IWishIcons.delivery_van,
                            titleColor: AppColors.textBlack,
                            hasShadow: true,
                            countTextColor: Colors.black,
                            iconSize: 16,
                            dateTextColor: Color(0xFF4F4F4F),
                          )
                        ],
                      ),
                      SizedBox(height: heightSizer(48, context)),
                      Text(
                        'Additional Information',
                        style: AppTextStyles.heading3(context)
                            .copyWith(fontSize: widthSizer(16, context)),
                      ),
                      SizedBox(height: heightSizer(12, context)),
                      InfoCard(
                        title: 'Add a Bank Account',
                        details:
                            'Enter bank account information where your earnings will be deposited.',
                        onTap: () {},
                      ),
                      SizedBox(height: heightSizer(12, context)),
                      InfoCard(
                        title: 'Business Information',
                        details:
                            'Complete important information about your business.',
                        onTap: () {},
                      ),
                      SizedBox(height: heightSizer(48, context)),
                      Text(
                        'Recent Transactions',
                        style: AppTextStyles.heading3(context)
                            .copyWith(fontSize: widthSizer(16, context)),
                      ),
                      SizedBox(height: heightSizer(12, context)),
                      const _RecentTransactions(),
                      SizedBox(height: heightSizer(30, context)),
                    ]),
              ),
            )));
  }
}

class _OrderAndDeliveryWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final Color countTextColor;
  final String title;
  final int count;
  final double iconContainerWidth;
  final double iconContainerHeight;
  final IconData icon;
  final double iconSize;
  final Color dateTextColor;
  final bool hasShadow;

  const _OrderAndDeliveryWidget(
      {Key? key,
      required this.backgroundColor,
      required this.title,
      required this.count,
      required this.iconContainerWidth,
      required this.iconContainerHeight,
      required this.icon,
      required this.titleColor,
      required this.countTextColor,
      required this.iconSize,
      required this.dateTextColor,
      this.hasShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      width: widthSizer(151, context),
      height: heightSizer(100, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                    color: const Color(0xFFAEAEAE).withOpacity(.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8)),
                BoxShadow(
                    color: const Color(0xFFAEAEAE).withOpacity(.15),
                    blurRadius: 20,
                    offset: const Offset(0, -8))
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: titleColor),
                  ),
                  SizedBox(height: heightSizer(6, context)),
                  Text(
                    count.toString(),
                    style: AppTextStyles.heading2(context).copyWith(
                        color: countTextColor,
                        fontSize: widthSizer(24, context)),
                  )
                ],
              ),
              IconContainer(
                width: iconContainerWidth,
                height: iconContainerHeight,
                child: Icon(
                  icon,
                  color: const Color(0xFFFFCC00),
                  size: iconSize,
                ),
              )
            ],
          ),
          const Spacer(),
          _DatePopUpMenu(
            textColor: dateTextColor,
            popBackgroundColor: backgroundColor,
          ),
        ],
      ),
    );
  }
}

class _DatePopUpMenu extends StatelessWidget {
  final ScrollController datePickerController = ScrollController();
  final Color textColor;
  final Color popBackgroundColor;

  _DatePopUpMenu(
      {Key? key,
      required this.textColor,
      this.popBackgroundColor = const Color(0xFF10002C)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List dateRange = [
      "July, 22 - Aug, 22",
      "June, 22 - July, 22",
      "May, 22 - June, 22",
      "April, 22 - May, 22",
      "Mar, 22 - April, 22",
      "Feb, 22 - Mar, 22",
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(textColor)),
      ),
      child: PopupMenuButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.transparent,
          splashRadius: 0,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxHeight: heightSizer(104, context),
            maxWidth: widthSizer(139, context),
          ),
          elevation: 0,
          position: PopupMenuPosition.under,
          offset: const Offset(0, -8),
          itemBuilder: (context) => [
                PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: heightSizer(104, context),
                      width: widthSizer(139, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: popBackgroundColor,
                      ),
                      child: Scrollbar(
                        thickness: 3,
                        controller: datePickerController,
                        thumbVisibility: true,
                        child: ListView.separated(
                            controller: datePickerController,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Text(
                                      dateRange[index],
                                      style:
                                          AppTextStyles.smallBodyText(context)
                                              .copyWith(color: textColor),
                                    ),
                                  ],
                                ),
                            separatorBuilder: (context, index) =>
                                const Align(child: Divider()),
                            itemCount: dateRange.length),
                      ),
                    )),
              ],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'June, 22 - July, 22',
                style: AppTextStyles.smallBodyText(context)
                    .copyWith(color: textColor),
              ),
              SizedBox(width: widthSizer(15, context)),
              Icon(
                IWishIcons.fluent_ios_arrow_down_24_regular,
                size: 10,
                color: textColor,
              ),
            ],
          )),
    );
  }
}

class _RecentTransactions extends StatelessWidget {
  const _RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => TransactionTile(
              onTap: () {},
              transactionModel: TransactionModel.demoFour,
            ),
        separatorBuilder: (context, index) =>
            SizedBox(height: heightSizer(12, context)),
        itemCount: 3);
  }
}
