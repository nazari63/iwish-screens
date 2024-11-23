import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.notificationsScreen);
      },
      child: Badge(
        position: BadgePosition.topStart(top: -3, start: -5),
        padding: const EdgeInsets.all(4.5),
        animationType: BadgeAnimationType.scale,
        child: Container(
          height: heightSizer(35, context),
          width: widthSizer(35, context),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(6)),
          child: const Icon(Icons.notifications_rounded, size: 20),
        ),
      ),
    );
  }
}
