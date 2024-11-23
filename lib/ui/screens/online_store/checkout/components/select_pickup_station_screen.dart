import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';
import 'package:wish_list/ui/widgets/custom_drop_down.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_text_styles.dart';
import '../../../../../utils/service_locator.dart';
import '../../../../../utils/widget_size_utils.dart';
import '../../../../widgets/general_button.dart';
import '../checkout_viewmodel.dart';

class SelectPickUpStation extends StatefulWidget {
  const SelectPickUpStation({Key? key}) : super(key: key);

  @override
  State<SelectPickUpStation> createState() => _SelectPickUpStationState();
}

class _SelectPickUpStationState extends State<SelectPickUpStation> {
  String stateRegionValue = 'Select a region';
  String cityValue = 'Select your city';
  String stationValue = 'Victoria Island Station';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithBackButton(
          title: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text('Checkout', style: AppTextStyles.heading2(context)),
          ),
          leadingWidth: widthSizer(100, context),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ChangeNotifierProvider<CheckOutModel>.value(
                value: serviceLocator<CheckOutModel>(),
                child: Consumer<CheckOutModel>(
                  builder: (context, model, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: heightSizer(24, context)),
                      Text(
                        'Select a pickup station',
                        style: AppTextStyles.heading3(context),
                      ),
                      SizedBox(height: heightSizer(24, context)),
                      CustomDropDownButton(
                        label: "State / Region",
                        value: stateRegionValue,
                        hintText: "Select a region",
                        items: <String>[]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: AppTextStyles.bodyText(context)
                                  .copyWith(color: AppColors.textBlack),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            stateRegionValue = value!;
                          });
                        },
                      ),
                      SizedBox(height: heightSizer(24, context)),
                      CustomDropDownButton(
                        label: 'City',
                        value: cityValue,
                        hintText: 'Select your city',
                        items: <String>[]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: AppTextStyles.bodyText(context)
                                  .copyWith(color: AppColors.textBlack),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            cityValue = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: heightSizer(24, context),
                      ),
                      CustomDropDownButton(
                        label: 'Select a pickup station near you',
                        value: stationValue,
                        hintText: 'Select your pickup station',
                        items: <String>[
                          'Victoria Island Station',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: AppTextStyles.bodyText(context)
                                  .copyWith(color: AppColors.textBlack),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            stationValue = value!;
                          });
                        },
                      ),
                      SizedBox(height: heightSizer(48, context)),
                      GeneralButton(
                        textFontWeight: FontWeight.w400,
                        textFontSize: widthSizer(16, context),
                        buttonText: 'Proceed',
                        onPressed: () {
                          Navigator.pop(context);
                          model.nextPage();
                        },
                      )
                    ],
                  ),
                ))));
  }
}
