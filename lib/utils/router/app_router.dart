import 'package:flutter/material.dart';
import 'package:wish_list/models/order_model.dart';
import 'package:wish_list/ui/screens/2fa_authentication/2fa_verify_sms_otp_screen.dart';
import 'package:wish_list/ui/screens/authentications/login_screen.dart';
import 'package:wish_list/ui/screens/authentications/verify_otp_screen.dart';
import 'package:wish_list/ui/screens/change_password/change_password_screen.dart';
import 'package:wish_list/ui/screens/notifications/notifications_screen.dart';
import 'package:wish_list/ui/screens/online_store/cart/cart_screen.dart';
import 'package:wish_list/ui/screens/profile/wisher_profile_screen.dart';
import 'package:wish_list/ui/screens/vendor/authentications/vendor_sign_up_screen.dart';
import 'package:wish_list/ui/screens/vendor/products/vendor_product_categories.dart';
import 'package:wish_list/ui/screens/wallet_screens/manage_cards_screen.dart';
import 'package:wish_list/ui/screens/wallet_screens/request_money/grant_money_request_screen.dart';
import 'package:wish_list/ui/screens/wallet_screens/request_money/grant_request_payment_screen.dart';
import 'package:wish_list/ui/screens/wallet_screens/set_transaction_pin_screen.dart';
import 'package:wish_list/ui/screens/wallet_screens/transaction_history/transaction_details_screen.dart';
import 'package:wish_list/ui/screens/wallet_screens/transfer_money/enter_transfer_money_pin.dart';
import 'package:wish_list/ui/screens/wallet_screens/transfer_money/transfer_money_screen.dart';
import 'package:wish_list/ui/screens/wishlist/wish_list_screen.dart';
import 'package:wish_list/utils/router/route_names.dart';

import '../../models/card_details.dart';
import '../../models/product.dart';
import '../../models/user.dart';
import '../../models/wish_list.dart';
import '../../models/wish_list_items.dart';
import '../../ui/screens/2fa_authentication/sms_verification_screen.dart';
import '../../ui/screens/2fa_authentication/two_factor_auth_screen.dart';
import '../../ui/screens/authentications/sign_up_screen.dart';
import '../../ui/screens/gift_box/box_item_screen.dart';
import '../../ui/screens/gift_box/gift_box_screen.dart';
import '../../ui/screens/grant_wish/components/grant_wish_payment_method_screen.dart';
import '../../ui/screens/grant_wish/components/grant_wish_payment_successful_screen.dart';
import '../../ui/screens/grant_wish/components/send_cash_equivalent_screen.dart';
import '../../ui/screens/grant_wish/grant_wish_from_store/grant_wish_product_description_screen.dart';
import '../../ui/screens/grant_wish/grant_wish_from_store/grant_wish_product_details_screen.dart';
import '../../ui/screens/grant_wish/grant_wish_screen.dart';
import '../../ui/screens/home_screens/home_screen.dart';
import '../../ui/screens/onboarding/create_account_option_screen.dart';
import '../../ui/screens/onboarding/onboarding_screen.dart';
import '../../ui/screens/online_store/checkout/checkout_screen.dart';
import '../../ui/screens/online_store/checkout/components/select_pickup_station_screen.dart';
import '../../ui/screens/online_store/online_wishlist_store.dart';
import '../../ui/screens/online_store/order_details_screen.dart';
import '../../ui/screens/online_store/product_description_screen.dart';
import '../../ui/screens/online_store/review_order_screen.dart';
import '../../ui/screens/online_store/track_order_screen.dart';
import '../../ui/screens/profile/edit_profile_screen.dart';
import '../../ui/screens/vendor/orders/components/single_order_screen.dart';
import '../../ui/screens/vendor/orders/orders_screen.dart';
import '../../ui/screens/vendor/overview/vendor_overview_screen.dart';
import '../../ui/screens/vendor/products/add_product_screen.dart';
import '../../ui/screens/vendor/products/products_screen.dart';
import '../../ui/screens/vendor/products/view_product.dart';
import '../../ui/screens/vendor/profile/add_bank_account_screen.dart';
import '../../ui/screens/vendor/profile/add_business_details_screen.dart';
import '../../ui/screens/vendor/profile/vendor_profile_screen.dart';
import '../../ui/screens/vendor/wallet/vendor_wallet_screen.dart';
import '../../ui/screens/wallet_screens/add_new_card.dart';
import '../../ui/screens/wallet_screens/bvn_verification.dart';
import '../../ui/screens/wallet_screens/fund_wallet/available_card_screen.dart';
import '../../ui/screens/wallet_screens/fund_wallet/enter_fund_wallet_amount_screen.dart';
import '../../ui/screens/wallet_screens/fund_wallet/enter_transaction_pin.dart';
import '../../ui/screens/wallet_screens/fund_wallet/fund_by_transfer.dart';
import '../../ui/screens/wallet_screens/request_money/request_money_from_contact_screen.dart';
import '../../ui/screens/wallet_screens/request_money/request_money_screen.dart';
import '../../ui/screens/wallet_screens/request_money/use_my_wallet_screen.dart';
import '../../ui/screens/wallet_screens/transaction_history/transaction_history_model.dart';
import '../../ui/screens/wallet_screens/transaction_history/transaction_history_screen.dart';
import '../../ui/screens/wallet_screens/transfer_money/transfer_to_iwish_user_screen.dart';
import '../../ui/screens/wallet_screens/wallet_screen.dart';
import '../../ui/screens/wishlist/components/create_wishlist_item.dart';
import '../../ui/screens/wishlist/components/create_wishlist_screen.dart';
import '../../ui/screens/wishlist/components/edit_wishlist_item.dart';
import '../../ui/screens/wishlist/components/edit_wishlist_screen.dart';
import '../../ui/screens/wishlist/components/wishlist_details_screen.dart';
import '../../ui/screens/wishlist/components/wishlist_item_details.dart';
import '../../ui/screens/wishlist/components/wishlist_items_screen.dart';
import '../../ui/screens/wishlist/popular_categories/popular_categories_full_view.dart';
import '../../ui/screens/wishlist/popular_categories/popular_categories_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoardingScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const OnboardingScreen(),
        );
      case RouteNames.createAccountOptionScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const CreateAccountOption(),
        );
      case RouteNames.signUpScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const SignUpScreen(),
        );
      case RouteNames.vendorSignUpScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorSignUpScreen(),
        );
      case RouteNames.loginScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const LoginScreen(),
        );

      case RouteNames.verifyOtpScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VerifyOtpScreen(),
        );

      case RouteNames.homeScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const HomeScreen(),
        );
      case RouteNames.popularCategories:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const PopularCategoriesScreen(),
        );
      case RouteNames.popularCategoriesFullView:
        String category = settings.arguments as String;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: PopularCategoriesFullView(
            category: category,
          ),
        );
      case RouteNames.wishListItemsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const WishListItemsScreen(),
        );
      case RouteNames.createWishListScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const CreateWishListScreen(),
        );
      case RouteNames.onlineWishlistStore:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const OnlineWishListStore(),
        );
      case RouteNames.checkOutScreen:
        bool forAnotherUser = settings.arguments as bool;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: CheckOutScreen(
            forAnotherUser: forAnotherUser,
          ),
        );
      case RouteNames.wishListDetailsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const WishlistDetailsScreen(),
        );

      case RouteNames.wishlistItemDetails:
        WishListItem wishListItem = settings.arguments as WishListItem;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: WishlistItemDetails(
            wishListItem: wishListItem,
          ),
        );
      case RouteNames.editWishListItemScreen:
        WishListItem wishListItem = settings.arguments as WishListItem;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: EditWishListItemScreen(
            wishListItem: wishListItem,
          ),
        );
      case RouteNames.editWishListScreen:
        WishList wishList = settings.arguments as WishList;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: EditWishListScreen(
            wishList: wishList,
          ),
        );
      case RouteNames.createWishListItemScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const CreateWishListItemScreen(),
        );
      case RouteNames.wishListScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const WishListScreen(),
        );
      case RouteNames.notificationsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const NotificationsScreen(),
        );
      case RouteNames.wisherProfileScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const WisherProfileScreen(),
        );
      case RouteNames.editProfileScreen:
        User user = settings.arguments as User;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: EditProfileScreen(user: user),
        );
      case RouteNames.changePassword:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: ChangePasswordScreen(),
        );

      case RouteNames.verifyTwoFaSmsOtpScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VerifyTwoFaOtpScreen(),
        );

      case RouteNames.cartScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const CartViewScreen(),
        );
      case RouteNames.productDescription:
        bool forGiftBox = settings.arguments as bool;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: ProductDescription(
            forGiftBox: forGiftBox,
          ),
        );
      case RouteNames.reviewOrderScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ReviewOrderScreen(),
        );
      case RouteNames.trackOrderScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const TrackOrder(),
        );
      case RouteNames.orderDetails:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const OrderDetails(),
        );
      case RouteNames.giftBoxScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const GiftBoxScreen(),
        );
      case RouteNames.boxItemView:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const BoxItemScreen(),
        );
      case RouteNames.selectPickUpStation:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const SelectPickUpStation(),
        );

      case RouteNames.wisherWalletScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const WalletScreen(),
        );

      case RouteNames.bvnVerificationScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const BVNVerificationScreen(),
        );
      case RouteNames.addNewCardScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const AddNewCardScreen(),
        );
      case RouteNames.setTransactionPinScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const SetTransactionPinScreen(),
        );
      case RouteNames.manageCardsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ManageCardsScreen(),
        );
      case RouteNames.enterTransactionPinScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const EnterTransactionPinScreen(),
        );
      case RouteNames.fundByTransferScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const FundWalletByTransferScreen(),
        );
      case RouteNames.availableCardsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const AvailableCardScreen(),
        );
      case RouteNames.enterFundWalletAmountScreen:
        CardDetails selectedCard = settings.arguments as CardDetails;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: EnterFundWalletAmountScreen(
            selectedCard: selectedCard,
          ),
        );
      case RouteNames.requestMoneyScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const RequestMoneyScreen(),
        );
      case RouteNames.requestMoneyFromContactScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const RequestMoneyFromContactScreen(),
        );
      case RouteNames.grantRequestScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const GrantRequestScreen(),
        );
      case RouteNames.grantRequestPaymentScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const GrantRequestPaymentScreen(),
        );
      case RouteNames.useMyWalletScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const UseMyWalletScreen(),
        );
      case RouteNames.transferMoneyScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const TransferMoneyScreen(),
        );
      case RouteNames.transferToIWishUserScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const TransferToIWishUserScreen(),
        );
      case RouteNames.enterTransferMoneyPinScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const EnterTransferMoneyPinScreen(),
        );
      case RouteNames.transactionHistoryScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const TransactionHistoryScreen(),
        );
      case RouteNames.transactionDetailsScreen:
        TransactionModel transactionModel =
            settings.arguments as TransactionModel;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: TransactionDetailsScreen(
            transactionModel: transactionModel,
          ),
        );
      case RouteNames.grantWishScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const GrantWishScreen(),
        );
      case RouteNames.grantWishProductDescriptionScreen:
        Product product = settings.arguments as Product;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: GrantWishProductDescriptionScreen(
            product: product,
          ),
        );
      case RouteNames.grantWishProductDetailsScreen:
        Product product = settings.arguments as Product;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: GrantWishProductDetailsScreen(
            product: product,
          ),
        );
      case RouteNames.grantWishPaymentMethodScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const GrantWishPaymentMethodScreen(),
        );
      case RouteNames.grantWishPaymentSuccessfulScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const GrantWishPaymentSuccessfulScreen(),
        );
      case RouteNames.sendCashEquivalentScreen:
        Product product = settings.arguments as Product;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: SendCashEquivalentScreen(
            product: product,
          ),
        );
      case RouteNames.vendorAddProductScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const AddProductScreen(),
        );
      case RouteNames.vendorOverviewScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorOverviewScreen(),
        );
      case RouteNames.vendorOrdersScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorOrdersScreen(),
        );
      case RouteNames.vendorProductsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorProductsScreen(),
        );

      case RouteNames.vendorProductsCategoryScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorProductsCategoryScreen(),
        );
      case RouteNames.vendorViewProductScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorViewProductScreen(),
        );
      case RouteNames.vendorOrderInfoScreen:
        OrderModel order = settings.arguments as OrderModel;
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: SingleOrderScreen(
            order: order,
          ),
        );
      case RouteNames.vendorProfileScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorProfileScreen(),
        );
      case RouteNames.twoFactorAuthScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const TwoFactorAuthScreen(),
        );
      case RouteNames.smsVerificationScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const SmsVerificationScreen(),
        );
      case RouteNames.addBankAccountScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: AddBankAccountScreen(),
        );
      case RouteNames.addBusinessDetailsScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: AddBusinessDetailsScreen(),
        );

      case RouteNames.vendorWalletScreen:
        return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const VendorWalletScreen(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static PageRoute _getPageRoute(
      {required String routeName, required Widget viewToShow}) {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => viewToShow);
  }
}
