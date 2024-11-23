import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/user_avatar.dart';

import '../../utils/app_colors.dart';
import '../../utils/i_wish_icons.dart';
import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';
import 'custom_back_button.dart';
import 'icon_container.dart';

class AppBarWithActions extends StatelessWidget implements PreferredSizeWidget {
  final bool notificationActive;
  final bool cartActive;

  const AppBarWithActions(
      {Key? key, this.notificationActive = false, this.cartActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: const Color(0x26AEAEAE).withOpacity(0.15),
              offset: const Offset(0, 8),
              blurRadius: 20)
        ]),
      ),
      backgroundColor: Colors.white,
      elevation: 6,
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: IconContainer(
            width: widthSizer(36, context),
            height: heightSizer(32, context),
            backgroundColor: AppColors.primaryColor,
            child: const Center(child: Icon(IWishIcons.bx_menu_alt_left)),
          )),
      actions: [
        _AppBarActionIcon(
          isActive: notificationActive,
          icon: IWishIcons.ic_baseline_notifications_none,
          onTap: () {
            Navigator.pushNamed(context, RouteNames.notificationsScreen);
          },
        ),
        SizedBox(width: widthSizer(24, context)),
        _AppBarActionIcon(
          isActive: cartActive,
          icon: IWishIcons.fluent_cart_16_regular,
          onTap: () {
            Navigator.pushNamed(context, RouteNames.cartScreen);
          },
        ),
        SizedBox(width: widthSizer(24, context)),
        UserAvatar(
            imageUrl: 'https://i.pravatar.cc/24',
            radius: widthSizer(12, context)),
        SizedBox(width: widthSizer(12, context))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarActionIcon extends StatelessWidget {
  const _AppBarActionIcon({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: heightSizer(12, context)),
            width: widthSizer(30, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isActive ? AppColors.primaryColor : Colors.transparent,
            ),
            child: Icon(icon,
                color: isActive ? Colors.white : AppColors.primaryColor,
                size: 18)));
  }
}

class AppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithBackButton(
      {Key? key,
      this.backButtonText = "Back",
      this.leadingWidth = 100,
      this.backRoute,
      this.title,
      this.centerTitle = true})
      : super(key: key);

  final String backButtonText;
  final double leadingWidth;

  /// The route to navigate when button is pressed.
  /// if null defaults to Navigator.pop();
  final String? backRoute;
  final Widget? title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: leadingWidth,
      leading: CustomBackButton(
        label: backButtonText,
        backRoute: backRoute,
        padding: EdgeInsets.only(left: widthSizer(24, context), right: 8),
      ),
      title: title,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithSkipButton extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithSkipButton(
      {Key? key,
      this.actionText = "Skip",
      this.leadingWidth = 100,
      this.backRoute,
      this.title,
      this.centerTitle = true,
      required this.onSkipPressed})
      : super(key: key);

  final String actionText;
  final double leadingWidth;

  /// The route to navigate when button is pressed.
  /// if null defaults to Navigator.pop();
  final String? backRoute;
  final Widget? title;
  final bool centerTitle;
  final VoidCallback onSkipPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title,
      centerTitle: centerTitle,
      actions: [
        GestureDetector(
          onTap: onSkipPressed,
          child: Padding(
            padding: EdgeInsets.only(right: widthSizer(24, context)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(actionText,
                    style: const TextStyle(color: Color(0xFF4F4F4F))),
                SizedBox(width: widthSizer(10, context)),
                const Icon(
                  IWishIcons.fluent_ios_arrow_ltr_24_regular,
                  color: Color(0xFF4F4F4F),
                  size: 16,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
