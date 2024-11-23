import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/i_wish_icons.dart';

import '../../../models/notifications.dart';
import '../../../utils/router/route_names.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/icon_container.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WisherBottomNav(
        currentNavParent: BottomNavParent.home,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppBarWithActions(
              notificationActive: true,
            ),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widthSizer(23, context)),
              child: Column(
                children: [
                  SizedBox(height: heightSizer(19, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: widthSizer(24, context),
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: IconContainer(
                          width: widthSizer(40, context),
                          backgroundColor: AppColors.primaryColor,
                          child: const Icon(
                            IWishIcons.carbon_close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: heightSizer(12, context)),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (Notifications.demoNotification[index]
                                    .notificationCategory ==
                                NotificationCategory.fundsRequest) {
                              Navigator.pushNamed(
                                  context, RouteNames.grantRequestScreen);
                            } else if (Notifications.demoNotification[index]
                                    .notificationCategory ==
                                NotificationCategory.wishRequest) {
                              Navigator.pushNamed(
                                  context, RouteNames.grantWishScreen);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: heightSizer(24, context)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconContainer(
                                  width: 31.5,
                                  backgroundColor: const Color(0xFFE5E0E9),
                                  child: Notifications
                                      .demoNotification[index].icon,
                                ),
                                SizedBox(width: widthSizer(15.8, context)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Notifications
                                            .demoNotification[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: widthSizer(18, context),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: heightSizer(4, context)),
                                      Text(
                                        Notifications.demoNotification[index]
                                            .description,
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: widthSizer(14, context),
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF333333)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          thickness: widthSizer(1, context),
                          color: const Color(0xFFE5E0E9),
                          height: 2,
                        );
                      },
                      itemCount: Notifications.demoNotification.length,
                    ),
                  )
                ],
              ),
            )));
  }
}
