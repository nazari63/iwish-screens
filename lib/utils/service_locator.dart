import 'package:get_it/get_it.dart';

import '../ui/screens/gift_box/giftbox_screen_model.dart';
import '../ui/screens/online_store/cart/cart_view_model.dart';
import '../ui/screens/online_store/checkout/checkout_viewmodel.dart';
import '../ui/screens/wallet_screens/wallet_view_model.dart';
import '../ui/screens/wishlist/wishlist_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(() => WishListViewModel());
  serviceLocator.registerLazySingleton(() => CartViewModel());
  serviceLocator.registerLazySingleton(() => CheckOutModel());
  serviceLocator.registerLazySingleton(() => GiftBoxScreenViewModel());
  serviceLocator.registerLazySingleton(() => WalletViewModel());
}
