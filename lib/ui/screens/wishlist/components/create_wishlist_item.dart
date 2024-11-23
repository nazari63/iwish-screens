import 'package:flutter/material.dart';
import 'package:wish_list/ui/widgets/upload_image_container.dart';

import '../../../../utils/service_locator.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/general_button.dart';
import '../wishlist_viewmodel.dart';

class CreateWishListItemScreen extends StatefulWidget {
  const CreateWishListItemScreen({Key? key}) : super(key: key);

  @override
  State<CreateWishListItemScreen> createState() =>
      _CreateWishListItemScreenState();
}

class _CreateWishListItemScreenState extends State<CreateWishListItemScreen> {
  String chosenValue = 'General';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: widthSizer(24, context),
            bottom: heightSizer(24, context),
            right: widthSizer(24, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create wishlist Item',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: widthSizer(24, context))),
            SizedBox(height: heightSizer(24, context)),
            const CustomTextFieldWithLabel(
              label: 'Name of Item',
              hintText: 'e.g MacBook Air',
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: heightSizer(24, context)),
            const CustomTextFieldWithLabel(
              label: 'Price',
              hintText: 'price in naira',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: heightSizer(24, context)),
            Text('Category',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: widthSizer(16, context))),
            SizedBox(height: heightSizer(12, context)),
            Container(
              height: heightSizer(58, context),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: const Color(0xFFF5F5F5),
                  isExpanded: true,
                  focusColor: const Color(0xFFF5F5F5),
                  value: chosenValue,
                  style: TextStyle(
                      fontSize: widthSizer(16, context), color: Colors.black),
                  iconEnabledColor: Colors.grey,
                  items: <String>[
                    'General',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      chosenValue = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: heightSizer(54, context)),
            const UploadImageContainer(),
            SizedBox(height: heightSizer(40, context)),
            GeneralButton(
                buttonText: 'Make a Wish',
                onPressed: () {
                  Navigator.pop(context);
                  serviceLocator<WishListViewModel>().createWishListItem();
                })
          ],
        ),
      ),
    );
  }
}
