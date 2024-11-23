import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/icon_container.dart';

import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import 'fund_wallet_dialog.dart';

class WalletActionButtons extends StatelessWidget {
  final bool forVendor;

  const WalletActionButtons({Key? key, this.forVendor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_WalletActionButton> vendorButtons = [
      _WalletActionButton(
        text: 'Transfer',
        icon: IWishIcons.fluent_arrow_upload_16_regular,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.transferMoneyScreen);
        },
      ),
      _WalletActionButton(
        text: 'Request',
        icon: IWishIcons.ri_refund_2_line,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.requestMoneyScreen);
        },
      ),
      _WalletActionButton(
        text: 'History',
        icon: IWishIcons.fluent_history_16_regular,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.transactionHistoryScreen);
        },
      )
    ];
    final List<_WalletActionButton> userButtons = [
      _WalletActionButton(
          text: 'Fund Wallet',
          icon: IWishIcons.fluent_arrow_download_16_regular,
          onPressed: () {
            FundWalletDialog.show(context);
          }),
      _WalletActionButton(
        text: 'Transfer',
        icon: IWishIcons.fluent_arrow_upload_16_regular,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.transferMoneyScreen);
        },
      ),
      _WalletActionButton(
        text: 'Request',
        icon: IWishIcons.ri_refund_2_line,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.requestMoneyScreen);
        },
      ),
      _WalletActionButton(
        text: 'History',
        icon: IWishIcons.fluent_history_16_regular,
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.transactionHistoryScreen);
        },
      )
    ];

    return Container(
      alignment: Alignment.center,
      height: heightSizer(63, context),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => forVendor? vendorButtons[index] : userButtons[index],
          separatorBuilder: (context, index) => SizedBox(
                width: widthSizer(29, context),
              ),
          itemCount: forVendor? vendorButtons.length : userButtons.length),
    );
  }
}

class _WalletActionButton extends StatelessWidget {
  const _WalletActionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: IconContainer(
              width: widthSizer(40, context),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              )),
        ),
        SizedBox(height: heightSizer(6, context)),
        Text(
          text,
          style: AppTextStyles.smallBodyText(context),
        )
      ],
    );
  }
}
