import 'package:flutter/material.dart';

import '../../utils/widget_size_utils.dart';

class DividerWithOr extends StatelessWidget {
  const DividerWithOr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFA5A5A5),
          ),
        ),
        SizedBox(width: widthSizer(16, context)),
        Text(
          'or',
          style: TextStyle(fontSize: widthSizer(16, context)),
        ),
        SizedBox(width: widthSizer(16, context)),
        const Expanded(
            child: Divider(
              color: Color(0xFFA5A5A5),
            )),
      ],
    );
  }
}
