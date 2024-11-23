import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/screens/online_store/cart/cart_details_screen.dart';
import 'package:wish_list/ui/screens/online_store/cart/empty_cart.dart';
import 'package:wish_list/utils/service_locator.dart';

import '../../../widgets/custom_app_bar.dart';
import 'cart_view_model.dart';

class CartViewScreen extends StatelessWidget {
  const CartViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWithActions(cartActive: true,),
      body: ChangeNotifierProvider<CartViewModel>.value(
          value: serviceLocator<CartViewModel>(),
          child: Consumer<CartViewModel>(
            builder: (context, viewModel, child) {
              return Visibility(
                  visible: viewModel.hasItemInCart,
                  replacement: const EmptyCart(),
                  child: const CartDetailsScreen());
            },
          )),
    );
  }
}
