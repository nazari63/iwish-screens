import 'package:wish_list/models/wish_list_items.dart';

class WishList {
  final String name;
  final String imageUrl;
  final String description;
  final List<WishListItem> items;

  /// Temporal variables just to mock UI
  final int itemCount;
  final int itemsGranted;

  WishList(
      {required this.name,
      // Todo:: Make required once integrated with Api
      this.imageUrl = 'https://picsum.photos/200',
      this.items = const [],
      this.itemCount = 0,
      this.itemsGranted = 0,
      this.description = ''});

  static final List<WishList> demoList = [
    WishList(
        name: 'My Birthday wishlist',
        description:
            'This is where the description of wishlist items sits after',
        itemCount: 10,
        itemsGranted: 6),
    WishList(
        name: 'My Travel wishlist',
        description:
            'This is where the description of wishlist items sits after',
        itemCount: 15,
        itemsGranted: 15),
    WishList(
        name: 'My Wedding wishlist',
        description:
            'This is where the description of wishlist items sits after',
        itemCount: 0,
        itemsGranted: 15)
  ];
}
