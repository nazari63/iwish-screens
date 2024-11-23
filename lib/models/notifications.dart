import 'package:flutter/material.dart';
import 'package:wish_list/utils/app_colors.dart';
import 'package:wish_list/utils/i_wish_icons.dart';

enum NotificationCategory { fundsRequest, walletFunded, discount, wishRequest }

class Notifications {
  final String title;
  final Widget icon;
  final String description;
  final NotificationCategory notificationCategory;

  Notifications(
      {required this.title,
      required this.icon,
      this.description = '',
      required this.notificationCategory});

  static final List<Notifications> demoNotification = [
    Notifications(
      title: 'Okocha is requesting for funds',
      description:
          'Okocha is requesting the sum of #5000. Click to process the funding of Okocha',
      icon: const Icon(
        IWishIcons.fluent_person_money_20_regular,
        color: AppColors.lightPurple,
        size: 24,
      ),
      notificationCategory: NotificationCategory.fundsRequest,
    ),
    Notifications(
      title: 'Your wallet was funded',
      description:
          'Your wallet was successfully funded with the sum of #10,000 using your credit card',
      icon: const Icon(
        IWishIcons.fluent_money_20_regular,
        color: AppColors.lightPurple,
      ),
      notificationCategory: NotificationCategory.walletFunded,
    ),
    Notifications(
      title: 'Summer sales discount',
      description:
          'Get 20% off this summer sales when you purchase products above #20,000',
      icon: const Icon(
        IWishIcons.fluent_tag_24_regular,
        color: AppColors.lightPurple,
      ),
      notificationCategory: NotificationCategory.discount,
    ),
    Notifications(
      title: 'Okocha is requesting for funds',
      description:
          'Okocha is requesting the sum of #5000. Click to process the funding of Okocha',
      icon: const Icon(
        IWishIcons.fluent_person_money_20_regular,
        color: AppColors.lightPurple,
      ),
      notificationCategory: NotificationCategory.fundsRequest,
    ),
    Notifications(
      title: 'Okocha is requesting that you grant his wish',
      description:
          'Okocha is requesting that you grant his wish. Click to grant Okocha\'s wish',
      icon: const Icon(
        IWishIcons.fluent_person_money_20_regular,
        color: AppColors.lightPurple,
      ),
      notificationCategory: NotificationCategory.wishRequest,
    ),
  ];
}
