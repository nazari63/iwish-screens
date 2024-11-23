import 'package:flutter/material.dart';
import 'package:wish_list/ui/screens/wallet_screens/request_money/request_money_successful_dialog.dart';

import '../../../../models/user.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';
import '../../../../utils/i_wish_icons.dart';
import '../../../../utils/widget_size_utils.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/general_button.dart';
import '../../../widgets/icon_container.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/user_avatar.dart';

class RequestMoneyFromContactScreen extends StatefulWidget {
  const RequestMoneyFromContactScreen({Key? key}) : super(key: key);

  @override
  State<RequestMoneyFromContactScreen> createState() =>
      _RequestMoneyFromContactScreenState();
}

class _RequestMoneyFromContactScreenState
    extends State<RequestMoneyFromContactScreen> {
  int _selectedFriendIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBackButton(
        title: Text(
          'Request #10,000 from?',
          style: AppTextStyles.heading4(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: widthSizer(24, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(placeHolder: 'Search for i-wish user'),
            SizedBox(height: heightSizer(24, context)),
            _InfoCardWithIcon(onTap: () {}),
            SizedBox(height: heightSizer(24, context)),
            Text(
              'Phone contact on i-wish',
              style: AppTextStyles.heading1(context).copyWith(fontSize: 16),
            ),
            SizedBox(height: heightSizer(12, context)),
            ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                return _FriendRadioTile(
                  index: index,
                  currentSelectedIndex: _selectedFriendIndex,
                  onTap: (val) {
                    setState(() {
                      _selectedFriendIndex = index;
                    });
                  },
                  user: User.friends[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: heightSizer(12, context));
              },
              itemCount: User.friends.length,
            ),
            SizedBox(height: heightSizer(24, context)),
            GeneralButton(
              buttonText: 'Proceed',
              onPressed: () {
                RequestMoneySuccessfulDialog.show(context);
              },
            ),
            SizedBox(height: heightSizer(24, context)),
          ],
        ),
      ),
    );
  }
}

class _InfoCardWithIcon extends StatelessWidget {
  const _InfoCardWithIcon({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthSizer(327, context),
        padding: EdgeInsets.symmetric(
            vertical: heightSizer(17, context),
            horizontal: widthSizer(10, context)),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFAEAEAE).withOpacity(.15),
                blurRadius: 20,
                offset: const Offset(0, 8))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconContainer(
              width: 40,
              backgroundColor: AppColors.lightPurple,
              child: Icon(
                IWishIcons.microphone,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Invite your friends',
                    style: AppTextStyles.heading4(context)),
                SizedBox(height: heightSizer(6, context)),
                Text('Share i-wish with your friends',
                    style: AppTextStyles.mediumBodyText(context)
                        .copyWith(color: AppColors.textBlack))
              ],
            ),
            const Spacer(),
            const Icon(
              IWishIcons.fluent_chevron_circle_right_24_regular,
              color: AppColors.lightPurple,
            )
          ],
        ),
      ),
    );
  }
}

class _FriendRadioTile extends StatelessWidget {
  final void Function(int) onTap;
  final int index;
  final int currentSelectedIndex;
  final User user;

  const _FriendRadioTile({
    Key? key,
    required this.onTap,
    required this.user,
    required this.index,
    required this.currentSelectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: widthSizer(327, context),
        child: Row(
          children: [
            UserAvatar(
                imageUrl: 'https://i.pravatar.cc/24',
                radius: widthSizer(25, context)),
            SizedBox(width: widthSizer(12, context)),
            Text(
              user.name,
              style: TextStyle(fontSize: widthSizer(16, context)),
            ),
            const Spacer(),
            Radio<int>(
                value: index,
                groupValue: currentSelectedIndex,
                fillColor: MaterialStateProperty.all(AppColors.lightPurple),
                onChanged: (val) {
                  if (val != null) {
                    onTap(val);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
