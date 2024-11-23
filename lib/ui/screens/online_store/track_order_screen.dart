import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../utils/i_wish_icons.dart';
import '../../../utils/widget_size_utils.dart';
import '../../widgets/icon_container.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(widthSizer(24, context)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Track Order',
            style: AppTextStyles.heading2(context),
          ),
          SizedBox(height: heightSizer(24, context)),
          Container(
            height: heightSizer(332, context),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/google_map.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: heightSizer(24, context)),
          _OrderTimeline(
            deliveryDate: DateTime(2022, 6, 12),
            stops: const ['Aree Avenue Road', 'Chelsea town'],
          ),
        ]),
      ),
    );
  }
}

class _OrderTimeline extends StatelessWidget {
  const _OrderTimeline({
    Key? key,
    required this.deliveryDate,
    this.stops = const [],
  }) : super(key: key);

  final DateTime deliveryDate;
  final List<String> stops;

  String formatDate(DateTime date) {
    final day = date.day;
    String attachment = "th";
    if (day == 1 || day == 21 || day == 31) {
      attachment = "st";
    } else if (day == 2 || day == 22) {
      attachment = "nd";
    } else if (day == 3 || day == 23) {
      attachment = "rd";
    }

    return DateFormat("$day'$attachment' MMMM").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          _TimelineWidget(
            indicatorLineHeight: stops.isEmpty ? 48 : 34,
            indicatorLineColor:
                stops.isEmpty ? AppColors.lightPurple : const Color(0xFFE5E0E9),
            indicator: IconContainer(
              height: heightSizer(40, context),
              backgroundColor: const Color(0xFFFE7100),
              width: widthSizer(37.5, context),
              child: const Icon(
                IWishIcons.fluent_location_24_regular,
                color: Colors.white,
                size: 20,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Estimate Delivery Date',
                      style: AppTextStyles.bodyText(context)
                          .copyWith(fontWeight: FontWeight.w400)),
                  SizedBox(height: heightSizer(6, context)),
                  Text(
                    formatDate(deliveryDate),
                    style: AppTextStyles.heading4(context),
                  ),
                ],
              ),
            ),
          ),

          /// list of intermediate stops
          ...List.generate(stops.length, (index) {
            final isLastStop = index == stops.length - 1;
            return _TimelineWidget(
              indicatorLineHeight: 40,
              indicatorLineColor:
                  isLastStop ? AppColors.lightPurple : const Color(0xFFE5E0E9),
              indicator: SizedBox(
                width: widthSizer(37.5, context),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: heightSizer(10, context),
                    width: widthSizer(10, context),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isLastStop
                              ? AppColors.lightPurple
                              : const Color(0xFFD9D9D9)),
                      color:
                          isLastStop ? Colors.white : const Color(0xFF4F4F4F),
                    ),
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  stops[index],
                  style: AppTextStyles.smallBodyText(context)
                      .copyWith(color: const Color(0xFF444444)),
                ),
              ),
            );
          }),
          _TimelineWidget(
            hasIndicatorLine: false,
            indicator: IconContainer(
              height: heightSizer(41, context),
              backgroundColor: AppColors.primaryColor,
              width: widthSizer(39.5, context),
              child: const Icon(
                IWishIcons.fluent_building_shop_16_regular,
                color: Colors.white,
                size: 20,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('i-Wish Headquarter store',
                      style: AppTextStyles.bodyText(context)
                          .copyWith(fontWeight: FontWeight.w400)),
                  SizedBox(height: heightSizer(6, context)),
                  Text(
                    'Alabata, Abeokuta',
                    style: AppTextStyles.smallBodyText(context)
                        .copyWith(color: const Color(0xFF444444)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineWidget extends StatelessWidget {
  final Widget indicator;
  final bool hasIndicatorLine;
  final double indicatorLineHeight;
  final Color indicatorLineColor;
  final Widget child;

  const _TimelineWidget(
      {Key? key,
      required this.indicator,
      required this.child,
      this.hasIndicatorLine = true,
      this.indicatorLineHeight = 24,
      this.indicatorLineColor = const Color(0xFFE5E0E9)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            indicator,
            Align(
                alignment: Alignment.center,
                child: hasIndicatorLine
                    ? SizedBox(
                        height: heightSizer(indicatorLineHeight, context),
                        child: VerticalDivider(
                          color: indicatorLineColor,
                          thickness: 1.2,
                        ),
                      )
                    : const SizedBox()),
          ],
        ),
        child
      ],
    );
  }
}
