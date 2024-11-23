import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';

import '../../../../../models/order_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_text_styles.dart';
import '../../../../../utils/widget_size_utils.dart';
import '../../../../widgets/custom_back_button.dart';
import '../../../../widgets/details_item.dart';
import '../../../../widgets/drawer_menu.dart';
import '../../../../widgets/general_button.dart';

class SingleOrderScreen extends StatelessWidget {
  final OrderModel order;

  const SingleOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: Colors.white,
      appBar: const AppBarWithActions(),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: heightSizer(24, context)),
              const CustomBackButton(padding: EdgeInsets.zero),
              SizedBox(height: heightSizer(24, context)),
              Text('Customer ID',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widthSizer(32, context))),
              SizedBox(height: heightSizer(12, context)),
              Text(
                order.customerId,
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
              SizedBox(height: heightSizer(24, context)),
              _CustomerOrder(orderModel: order),
              SizedBox(height: heightSizer(38, context)),
            ],
          )),
    );
  }
}

class _CustomerOrder extends StatelessWidget {
  final OrderModel orderModel;
  final double _detailItemEndIndent = 0;
  final double _detailHorizontalPadding = 11;
  final double _detailMarginBottom = 15;

  const _CustomerOrder({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: heightSizer(15, context)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFDCC1FF)),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFAEAEAE).withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 8))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsItem(
              endIndent: _detailItemEndIndent,
              horizontalPadding: _detailHorizontalPadding,
              marginBottom: _detailMarginBottom,
              title: 'Customer Name',
              subTitle: orderModel.name),
          SizedBox(height: heightSizer(15, context)),
          DetailsItem(
              endIndent: _detailItemEndIndent,
              horizontalPadding: _detailHorizontalPadding,
              marginBottom: _detailMarginBottom,
              title: 'Email Address',
              subTitle: orderModel.emailAddress),
          SizedBox(height: heightSizer(15, context)),
          DetailsItem(
              endIndent: _detailItemEndIndent,
              horizontalPadding: _detailHorizontalPadding,
              marginBottom: _detailMarginBottom,
              title: 'Delivery Address',
              subTitle: orderModel.deliveryAddress),
          SizedBox(height: heightSizer(15, context)),
          DetailsItem(
              endIndent: _detailItemEndIndent,
              horizontalPadding: _detailHorizontalPadding,
              marginBottom: _detailMarginBottom,
              title: 'Contact',
              subTitle: orderModel.contact),
          SizedBox(height: heightSizer(15, context)),
          DetailsItem(
              endIndent: _detailItemEndIndent,
              horizontalPadding: _detailHorizontalPadding,
              marginBottom: _detailMarginBottom,
              title: 'Date',
              subTitle: orderModel.date),
          SizedBox(height: heightSizer(15, context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(11, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ordered Item',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textGrey),
                ),
                SizedBox(height: heightSizer(6, context)),
                Text(
                  orderModel.product.name,
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack),
                ),
                SizedBox(height: heightSizer(3, context)),
                Text(
                  'Quantity: ${orderModel.product.availableQuantity}',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack),
                ),
                SizedBox(height: heightSizer(3, context)),
                Text(
                  'Size: ${orderModel.product.availableSizes[0]}',
                  style: AppTextStyles.mediumBodyText(context)
                      .copyWith(color: AppColors.textBlack),
                ),
                SizedBox(height: heightSizer(19, context)),
              ],
            ),
          ),
          const Divider(
            color: AppColors.bgColor,
            height: 2,
          ),
          SizedBox(height: heightSizer(15, context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(11, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Status',
                      style: AppTextStyles.mediumBodyText(context)
                          .copyWith(color: AppColors.textGrey),
                    ),
                    SizedBox(height: heightSizer(6, context)),
                    Row(
                      children: [
                        Text(
                          orderModel.status.name,
                          style: AppTextStyles.bodyText(context)
                              .copyWith(color: AppColors.textBlack),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                              color: orderModel.statusColor,
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    SizedBox(height: heightSizer(7, context)),
                  ],
                ),
                GeneralButton(
                  buttonText: 'Track Order',
                  onPressed: () {},
                  width: widthSizer(140, context),
                  height: heightSizer(48, context),
                  textFontWeight: FontWeight.w400,
                  textFontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
