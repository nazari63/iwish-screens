import 'package:flutter/material.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import '../../utils/app_colors.dart';
import '../../utils/i_wish_icons.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: widthSizer(272, context),
      child: SafeArea(
        child: SizedBox(
          height: ScreenSize.height(context),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: widthSizer(26, context),
                    top: widthSizer(34, context),
                    bottom: widthSizer(38, context)),
                child: Image.asset('assets/images/drawer_image.png'),
              ),
              const _DrawerMenuDivider(),
              SizedBox(height: heightSizer(10, context)),
              _DrawerMenuTile(
                isActive: true,
                icon: IWishIcons.fluent_person_24_regular,
                label: 'Profile',
                onTap: () {},
              ),
              _DrawerMenuTile(
                icon:
                    IWishIcons.fluent_document_bullet_list_multiple_20_regular,
                label: 'My Orders',
                onTap: () {},
              ),
              _DrawerMenuTile(
                icon: IWishIcons.fluent_people_24_regular,
                label: 'Invite a friend',
                onTap: () {},
              ),
              _DrawerMenuTile(
                icon: IWishIcons.fluent_chat_help_24_regular,
                label: 'FAQs',
                onTap: () {},
              ),
              _DrawerMenuTile(
                icon: IWishIcons.fluent_person_question_mark_16_regular,
                label: 'Help',
                onTap: () {},
              ),
              _DrawerMenuTile(
                icon: IWishIcons.fluent_building_shop_20_regular,
                label: 'Become a Vendor',
                onTap: () {},
              ),
              SizedBox(height: ScreenSize.height(context) / 4),
              const _DrawerMenuDivider(),
              _DrawerMenuTile(
                icon: IWishIcons.fluent_power_24_regular,
                label: 'Logout',
                iconColor: AppColors.red,
                textColor: AppColors.red,
                onTap: () {},
              ),
              SizedBox(height: heightSizer(30, context))
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerMenuDivider extends StatelessWidget {
  const _DrawerMenuDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Divider(
        thickness: 1,
        color: Color(0xFFE5E0E9),
        height: 2,
      ),
    );
  }
}

class _DrawerMenuTile extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color iconColor;
  final double? iconSize;
  final Color textColor;
  final String label;
  final VoidCallback onTap;

  const _DrawerMenuTile(
      {Key? key,
      this.isActive = false,
      required this.onTap,
      this.iconColor = AppColors.lightPurple,
      this.textColor = AppColors.textBlack,
      required this.icon,
      required this.label,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        onTap();
      },
      child: Container(
        height: heightSizer(44, context),
        margin: EdgeInsets.only(
            left: widthSizer(24, context),
            right: widthSizer(21, context),
            bottom: heightSizer(16, context)),
        padding: EdgeInsets.only(
          left: widthSizer(12, context),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isActive ? const Color(0xFFE5E0E9) : Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            SizedBox(width: widthSizer(8, context)),
            Text(
              label,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: widthSizer(16, context)),
            )
          ],
        ),
      ),
    );
  }
}
