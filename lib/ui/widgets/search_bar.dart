import 'package:flutter/material.dart';
import 'package:wish_list/utils/i_wish_icons.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

import 'custom_text_form_field.dart';
import 'icon_container.dart';

class SearchBar extends StatelessWidget {
  final String placeHolder;
  const SearchBar({Key? key, this.placeHolder = 'Search for keywords'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFDCC1FF),
          ),
          borderRadius: BorderRadius.circular(8.0)),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: CustomTextFormField(
            hintText: placeHolder,
            fillColor: Colors.transparent,
          )),
          IconContainer(
            width: widthSizer(35, context),
            child: Icon(
              IWishIcons.fluent_search_24_regular,
              color: Colors.white,
              size: widthSizer(24, context),
            ),
          )
        ],
      ),
    );
  }
}
