import 'package:flutter/material.dart';
import 'package:wish_list/models/wish_list.dart';
import 'package:wish_list/utils/app_colors.dart';

import '../../utils/router/route_names.dart';
import '../../utils/widget_size_utils.dart';
import '../screens/wishlist/components/delete_wishlist_dialog.dart';
import '../screens/wishlist/components/share_option_dialog.dart';

class WishListCard extends StatefulWidget {
  final WishList wishList;

  const WishListCard({Key? key, required this.wishList}) : super(key: key);

  @override
  State<WishListCard> createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.wishListDetailsScreen);
      },
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFE5E0E9),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: widthSizer(6, context)),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox.square(
                  dimension: widthSizer(110, context),
                  child: Image.network('https://picsum.photos/200',
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(width: widthSizer(13, context)),
              Container(
                width: widthSizer(189, context),
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: _WishListItemOptionPopUpMenu(
                        onEditTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, RouteNames.editWishListScreen,
                              arguments: widget.wishList);
                        },
                      ),
                    ),
                    Text(
                      widget.wishList.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: widthSizer(18, context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: heightSizer(6, context)),
                    SizedBox(
                      height: heightSizer(38, context),
                      child: Text(
                        widget.wishList.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: widthSizer(14, context),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: heightSizer(12, context)),
                    SizedBox(
                      // padding: const EdgeInsets.only(right: 5.0),
                      width: widthSizer(180, context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: widget.wishList.itemCount > 0
                              ? widget.wishList.itemsGranted /
                                  widget.wishList.itemCount
                              : 0,
                          color: AppColors.lightPurple,
                          backgroundColor: AppColors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: heightSizer(3, context)),
                    SizedBox(
                      // padding: const EdgeInsets.only(right: 5.0),
                      width: widthSizer(180, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.wishList.itemCount > 1
                              ? Text(
                                  '${widget.wishList.itemCount.toString()} items',
                                  style: const TextStyle(fontSize: 10),
                                )
                              : Text(
                                  '${widget.wishList.itemCount.toString()} item',
                                  style: const TextStyle(fontSize: 10),
                                ),
                          widget.wishList.itemCount > 0
                              ? Text(
                                  '${((widget.wishList.itemsGranted / widget.wishList.itemCount) * 100).round()}% granted',
                                  style: TextStyle(
                                      fontSize: widthSizer(10, context)),
                                )
                              : Text(
                                  '0% granted',
                                  style: TextStyle(
                                      fontSize: widthSizer(10, context)),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class _WishListItemOptionPopUpMenu extends StatelessWidget {
  final void Function() onEditTap;

  const _WishListItemOptionPopUpMenu({Key? key, required this.onEditTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widthSizer(8, context)),
          color: Colors.black,
        ),
        child: PopupMenuButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 14,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: const Color(0xFF080016),
            elevation: 5,
            enabled: true,
            onSelected: (value) {
              // setState(() {});
            },
            itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 0,
                    height: 12,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    padding: const EdgeInsets.only(left: 16, bottom: 12),
                    height: 20,
                    child: GestureDetector(
                      onTap: onEditTap,
                      child: Text(
                        "Edit wishlist",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthSizer(14, context)),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    padding: const EdgeInsets.only(left: 16, bottom: 12),
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        ShareOptionDialog.show(context);
                      },
                      child: Text(
                        "Share wishlist",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthSizer(14, context)),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    padding: const EdgeInsets.only(left: 16, bottom: 12),
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        DeleteWishlistDialog.show(context);
                      },
                      child: Text(
                        "Delete wishlist",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthSizer(14, context)),
                      ),
                    ),
                  ),
                ]));
  }
}
