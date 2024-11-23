import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(
      {Key? key,
      required this.crossAxisCount,
      required this.items,
      this.rowGap = 20,
      this.columnGap = 20})
      : super(key: key);

  final int crossAxisCount;
  final List<Widget> items;
  final double rowGap;
  final double columnGap;

  @override
  Widget build(BuildContext context) {
    final rowSizes = List.generate(crossAxisCount, (index) => auto);
    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: rowSizes,
      // set all the row sizes to auto (self-sizing height)
      rowSizes: List.generate(
          (items.length / crossAxisCount).floor(), (index) => auto),
      rowGap: rowGap, // equivalent to mainAxisSpacing
      columnGap: columnGap, // equivalent to crossAxisSpacing
      // note: there's no childAspectRatio
      children: items,
    );
  }
}
