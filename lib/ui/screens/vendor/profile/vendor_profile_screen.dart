import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/router/route_names.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/info_card.dart';
import '../../../widgets/profile_screen_security_section.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VendorBottomNav(
      currentNavParent: BottomNavParent.vendorProfile,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppBarWithActions(),
          body: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: heightSizer(20, context)),
                  ProfileScreenHeading(user: Vendor.demoVendor),
                  SizedBox(height: heightSizer(24, context)),
                  ProfileScreenNameAndImage(name: Vendor.demoVendor.name),
                  SizedBox(height: heightSizer(48, context)),
                  ProfileScreenFieldAndValue(
                    field: 'Email',
                    value: Vendor.demoVendor.email,
                  ),
                  SizedBox(height: heightSizer(24, context)),
                  ProfileScreenFieldAndValue(
                      field: 'Mobile Number',
                      value: Vendor.demoVendor.mobileNumber),
                  SizedBox(height: heightSizer(24, context)),
                  ChangeNotifierProvider<Vendor>.value(
                    value: Vendor.demoVendor,
                    child:
                        Consumer<Vendor>(builder: (context, viewModel, child) {
                      return Visibility(
                          visible: (!(Vendor.demoVendor.hasRegisteredBVN &&
                              Vendor.demoVendor.hasBusinessDetails)),
                          replacement: const SizedBox(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: heightSizer(24, context)),
                              Text(
                                'Account Information',
                                style: AppTextStyles.heading3(context),
                              ),
                              SizedBox(height: heightSizer(24, context)),
                              Visibility(
                                visible: !Vendor.demoVendor.hasRegisteredBVN,
                                replacement: const SizedBox(),
                                child: Column(
                                  children: [
                                    InfoCard(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            RouteNames.addBankAccountScreen);
                                      },
                                      title: 'Add a Bank Account',
                                      details:
                                          'Enter bank account information where your earnings will be deposited.',
                                    ),
                                    SizedBox(height: heightSizer(12, context)),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: !Vendor.demoVendor.hasBusinessDetails,
                                replacement: const SizedBox(),
                                child: InfoCard(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RouteNames.addBusinessDetailsScreen);
                                  },
                                  title: 'Business Information',
                                  details:
                                      'Complete important information about your business.',
                                ),
                              ),
                            ],
                          ));
                    }),
                  ),
                  SizedBox(height: heightSizer(48, context)),
                  const ProfileScreenSecuritySection(),
                ],
              ))),
    );
  }
}
