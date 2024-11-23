import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/utils/string_utils.dart';

import '../../../../models/order_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/details_item.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/search_bar.dart';

class VendorOrdersScreen extends StatelessWidget {
  const VendorOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: VendorBottomNav(
          currentNavParent: BottomNavParent.vendorOrders,
          child: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: heightSizer(24, context)),
                  Text('Customer Orders',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: widthSizer(32, context))),
                  SizedBox(height: heightSizer(24, context)),
                  const SearchBar(),
                  SizedBox(height: heightSizer(24, context)),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return _CustomerOrders(
                          orderModel: OrderModel.orders[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: heightSizer(24, context));
                    },
                    itemCount: OrderModel.orders.length,
                  ),
                  SizedBox(height: heightSizer(40, context)),
                ],
              )),
        ));
  }
}

class _CustomerOrders extends StatelessWidget {
  final OrderModel orderModel;
  final double _detailItemEndIndent = 0;
  final double _detailHorizontalPadding = 11;
  final double _detailMarginBottom = 15;

  const _CustomerOrders({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.vendorOrderInfoScreen,
            arguments: orderModel);
      },
      child: Container(
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
                title: "Customer ID",
                subTitle: orderModel.customerId),
            SizedBox(height: heightSizer(15, context)),
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
                title: 'Date',
                subTitle: orderModel.date),
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
                title: 'Amount',
                subTitle: '#${orderModel.getAmount()}'),
            SizedBox(height: heightSizer(15, context)),
            DetailsItem(
                endIndent: _detailItemEndIndent,
                horizontalPadding: _detailHorizontalPadding,
                marginBottom: _detailMarginBottom,
                title: 'Contact',
                subTitle: orderModel.contact),
            SizedBox(height: heightSizer(15, context)),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: widthSizer(11, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textGrey),
                  ),
                  SizedBox(height: heightSizer(6, context)),
                  Row(
                    children: [
                      Text(
                        StringUtils.capitalize(orderModel.status.name),
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
            ),
          ],
        ),
      ),
    );
  }
}
