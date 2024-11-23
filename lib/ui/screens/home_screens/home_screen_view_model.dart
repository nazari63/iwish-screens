import '../../../models/wish_list.dart';

class HomeScreenViewModel {
  static List<String> categories = [
    'Fashion',
    'Gadgets',
    'Sport',
    'Game',
    'Wedding',
    'Travel'
  ];

  static final List<WishList> wishLists = [
    WishList(name: 'Gaming'),
    WishList(name: 'Birthday', itemCount: 6),
    WishList(name: 'Work', itemCount: 5),
    WishList(name: 'Wedding')
  ];
}
