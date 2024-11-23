import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final String imageUrl;

  const CategoryItem({
    Key? key,
    required this.label,
    this.width = 140,
    this.height = 80,

    /// This default value is just to mock the UI
    this.imageUrl = 'http://placeimg.com/350/200/tech',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.popularCategoriesFullView,
            arguments: label);
      },
      child: Column(
        children: [
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imageUrl),
                  ),
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8)),
              child: null),
          SizedBox(
            height: heightSizer(12, context),
          ),
          Text(label,
              style: TextStyle(
                  fontSize: widthSizer(15, context),
                  color: AppColors.textBlack))
        ],
      ),
    );
  }
}
