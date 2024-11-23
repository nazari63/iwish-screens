import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wish_list/ui/widgets/custom_app_bar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/drawer_menu.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/upload_image_container.dart';
import '../../../widgets/uploaded_image_view.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: Colors.white,
        appBar: const AppBarWithActions(),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: heightSizer(24, context)),
              const CustomBackButton(padding: EdgeInsets.zero),
              SizedBox(height: heightSizer(24, context)),
              const CustomTextFieldWithLabel(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Product Name',
                hintText: 'e.g Nike Air Force',
              ),
              SizedBox(height: heightSizer(24, context)),
              Text(
                'Product Description',
                style: AppTextStyles.bodyText(context)
                    .copyWith(color: AppColors.textBlack),
              ),
              SizedBox(height: heightSizer(12, context)),
              const _DescriptionTextField(),
              SizedBox(height: heightSizer(24, context)),
              const _UploadImageSection(),
              SizedBox(height: heightSizer(24, context)),
              const CustomTextFieldWithLabel(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: heightSizer(36, context)),
              Text(
                'Please fill in the fields below in correlation with product’s information',
                style: AppTextStyles.heading3(context).copyWith(fontSize: 16),
              ),
              SizedBox(height: heightSizer(24, context)),
              CustomTextFieldWithLabel(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                label: 'Number of items in stock',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: heightSizer(24, context)),
              const _ProductCategory(),
              SizedBox(height: heightSizer(24, context)),
              const _ProductDetailsSection(),
              SizedBox(height: heightSizer(48, context)),
              Row(
                children: [
                  GeneralButton(
                    width: widthSizer(140, context),
                    height: heightSizer(48, context),
                    buttonText: 'Save to Draft',
                    buttonColor: Colors.white,
                    borderColor: AppColors.primaryColor,
                    textColor: AppColors.primaryColor,
                    onPressed: () {},
                    textFontSize: 16,
                    textFontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: widthSizer(24, context)),
                  GeneralButton(
                    width: widthSizer(162, context),
                    height: heightSizer(48, context),
                    buttonText: 'Publish Product',
                    onPressed: () {},
                    textFontSize: 16,
                    textFontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: heightSizer(41, context)),
            ])));
  }
}

class _ProductDetailsSection extends StatefulWidget {
  const _ProductDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<_ProductDetailsSection> createState() => _ProductDetailsSectionState();
}

class _ProductDetailsSectionState extends State<_ProductDetailsSection> {
  final List<_ProductDetail> _details = [const _ProductDetail()];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Details',
          style: AppTextStyles.bodyText(context),
        ),
        SizedBox(height: heightSizer(12, context)),
        Text(
          'Fill the fields below if your product has various options like sizes and colors. Press space bar to submit each input',
          style: AppTextStyles.smallBodyText(context),
        ),
        SizedBox(height: heightSizer(12, context)),
        ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return _details[index];
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: heightSizer(12, context));
            },
            itemCount: _details.length),
        SizedBox(height: heightSizer(24, context)),
        GestureDetector(
          onTap: () {
            _details.add(const _ProductDetail());
            setState(() {});
          },
          child: Row(
            children: [
              Text(
                'Add more details',
                style: AppTextStyles.heading2(context)
                    .copyWith(color: AppColors.lightPurple, fontSize: 16),
              ),
              const SizedBox(width: 12),
              const Icon(
                IWishIcons.fluent_add_24_regular,
                color: AppColors.lightPurple,
                size: 17.5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
      height: heightSizer(169, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFABAAAA))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bold',
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: const Color(0xFFABAAAA)),
              ),
              SizedBox(width: widthSizer(12, context)),
              Text(
                'Italics',
                style: AppTextStyles.mediumBodyText(context)
                    .copyWith(color: const Color(0xFFABAAAA)),
              ),
              SizedBox(width: widthSizer(12, context)),
              const Icon(
                IWishIcons.fluent_text_number_list_ltr_16_regular,
                color: Color(0xFFABAAAA),
                size: 18,
              ),
              SizedBox(width: widthSizer(12, context)),
              const Icon(
                IWishIcons.fluent_text_bullet_list_ltr_24_regular,
                color: Color(0xFFABAAAA),
                size: 18,
              ),
            ],
          ),
          SizedBox(height: heightSizer(12, context)),
          Expanded(
              child: CustomTextFormField(
            maxLines: 7,
            isFilled: false,
            contentPadding: EdgeInsets.zero,
            hintText:
                "The shoes had been there for as long as anyone could remember. In fact, it was difficult for anyone to come up with a date they had first appeared. It had seemed they'd always been there and yet they seemed so out of place.",
          ))
        ],
      ),
    );
  }
}

class _UploadImageSection extends StatefulWidget {
  const _UploadImageSection({Key? key}) : super(key: key);

  @override
  State<_UploadImageSection> createState() => _UploadImageSectionState();
}

class _UploadImageSectionState extends State<_UploadImageSection> {
  bool hasUploadedImages = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Image',
          style: AppTextStyles.bodyText(context)
              .copyWith(color: AppColors.textBlack),
        ),
        SizedBox(height: heightSizer(12, context)),
        GestureDetector(
            onTap: () {
              setState(() {
                hasUploadedImages = true;
              });
            },
            child: const UploadImageContainer()),
        SizedBox(height: heightSizer(12, context)),
        Visibility(
          visible: !hasUploadedImages,
          replacement: const SizedBox(),
          child: Text('Maximum of 5 images',
              style: AppTextStyles.smallBodyText(context)
                  .copyWith(color: const Color(0xFF4F4F4F))),
        ),
        Visibility(
          visible: hasUploadedImages,
          replacement: const SizedBox(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: heightSizer(12, context)),
              Text('Upload other images of your product',
                  style: AppTextStyles.bodyText(context)
                      .copyWith(color: const Color(0xFF4F4F4F))),
              SizedBox(height: heightSizer(12, context)),
              const _UploadProgressBar(),
              SizedBox(height: heightSizer(24, context)),
              const UploadedImageView(),
              SizedBox(height: heightSizer(12, context)),
              const UploadedImageView()
            ],
          ),
        )
      ],
    );
  }
}

class _UploadProgressBar extends StatelessWidget {
  const _UploadProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      animation: true,
      lineHeight: heightSizer(58, context),
      animationDuration: 2500,
      percent: 0.4,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Upload in progress (2/5)',
            style: AppTextStyles.mediumBodyText(context)
                .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Icon(
            IWishIcons.fluent_cloud_arrow_up_32_regular,
            size: 21,
            color: AppColors.grey,
          )
        ],
      ),
      barRadius: const Radius.circular(8),
      backgroundColor: AppColors.bgColor,
      progressColor: const Color(0xFF080016),
    );
  }
}

class _ProductDetail extends StatefulWidget {
  const _ProductDetail({Key? key}) : super(key: key);

  @override
  State<_ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<_ProductDetail> {
  final List<String> options = [];
  final _textController = TextEditingController();

  final _detailTypes = ['Size', 'Color', 'Weight'];
  int _selectedDetailTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widthSizer(100, context),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButton<String>(
              icon: const Icon(IWishIcons.fluent_ios_arrow_down_24_regular,
                  size: 18),
              style:
                  AppTextStyles.bodyText(context).copyWith(color: Colors.black),
              items: _detailTypes.map((e) {
                return DropdownMenuItem(
                    value: e,
                    child: Text(e, style: AppTextStyles.bodyText(context)));
              }).toList(),
              value: _detailTypes[_selectedDetailTypeIndex],
              underline: const SizedBox(),
              onChanged: (value) {
                if (value != null && value.isNotEmpty) {
                  setState(() {
                    _selectedDetailTypeIndex = _detailTypes.indexOf(value);
                  });
                }
              }),
        ),
        SizedBox(width: widthSizer(20, context)),
        Expanded(
          child: Container(
            // height: heightSizer(58, context),
            decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8)),
            child: Wrap(
              children: [
                ...List.generate(
                  options.length,
                  (index) => _ProductDetailTag(
                    data: options[index],
                    onDeletePressed: () {
                      options.removeAt(index);
                      setState(() {});
                    },
                  ),
                ),
                CustomTextFormField(
                  width: widthSizer(100, context),
                  contentPadding:
                      const EdgeInsets.only(left: 6, top: 18, bottom: 18),
                  hintText: '|',
                  controller: _textController,
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.endsWith(' ')) {
                        if (value.trim().isNotEmpty) {
                          setState(() {
                            options.add(_textController.text);
                            _textController.clear();
                          });
                        }
                      }
                    }
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _ProductDetailTag extends StatelessWidget {
  final String data;
  final VoidCallback onDeletePressed;

  const _ProductDetailTag(
      {Key? key, required this.data, required this.onDeletePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.lightPurple, borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widthSizer(100, context)),
            child: Text(
              data,
              overflow: TextOverflow.ellipsis,
              style:
                  AppTextStyles.bodyText(context).copyWith(color: Colors.white),
            ),
          ),
          SizedBox(width: widthSizer(10, context)),
          GestureDetector(
              onTap: onDeletePressed,
              child: const Icon(IWishIcons.carbon_close, color: Colors.white))
        ],
      ),
    );
  }
}

class _ProductCategory extends StatefulWidget {
  const _ProductCategory({Key? key}) : super(key: key);

  @override
  State<_ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<_ProductCategory> {
  ScrollController scrollController = ScrollController();
  bool showDropdown = false;
  static final List<String> _categories = [
    "Male Shoes",
    "Shoes",
    "Gadgets",
    "Clothes",
    "Travels",
  ];
  static final List<String> _selectedCategories = [];
  final List _isChecked = List<bool>.filled(_categories.length, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Category',
          style: AppTextStyles.bodyText(context)
              .copyWith(color: AppColors.textBlack),
        ),
        SizedBox(height: heightSizer(12, context)),
        GestureDetector(
          onTap: () {
            setState(() {
              showDropdown = !showDropdown;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: heightSizer(58, context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF5F5F5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedCategories.isEmpty
                    ? 'General'
                    : _selectedCategories.join(', ')),
                const Icon(
                  IWishIcons.fluent_ios_arrow_down_24_regular,
                  size: 18,
                  color: AppColors.textBlack,
                )
              ],
            ),
          ),
        ),
        Visibility(
            visible: showDropdown,
            replacement: const SizedBox(),
            child: Column(
              children: [
                SizedBox(height: heightSizer(12, context)),
                Container(
                  padding: const EdgeInsets.only(
                      top: 18, bottom: 18, left: 11, right: 8),
                  height: heightSizer(210, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: scrollController,
                    child: ListView.separated(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      itemCount: _categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: AppColors.lightPurple,
                                      width: _isChecked[index] ? 2 : 1)),
                              width: 18,
                              height: 18,
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Checkbox(
                                  fillColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  checkColor: AppColors.lightPurple,
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  value: _isChecked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      if (_selectedCategories
                                          .contains(_categories[index])) {
                                        _selectedCategories
                                            .remove(_categories[index]);
                                      } else {
                                        _selectedCategories
                                            .add(_categories[index]);
                                      }
                                      debugPrint(
                                          _selectedCategories.toString());
                                      _isChecked[index] = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: widthSizer(15, context)),
                            Text(_categories[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: widthSizer(14, context),
                                    color: const Color(0xFF333333))),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: heightSizer(15, context)),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
