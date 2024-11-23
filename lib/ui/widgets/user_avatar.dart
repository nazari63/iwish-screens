import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Displays users profile image
/// if an error is returned, it displays their initials
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.imageUrl,
    this.cacheKey,
    this.radius = 38,
  }) : super(key: key);

  final String imageUrl;
  final String? cacheKey;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      // httpHeaders: HttpService.getHeaders(),
      cacheKey: cacheKey,
      imageBuilder: (context, imageProvider) => Center(
        child: CircleAvatar(
          radius: radius,
          foregroundImage: imageProvider,
        ),
      ),

      //     Container(
      //   height: radius * 2,
      //   width: radius * 2,
      //   constraints: BoxConstraints(
      //     minWidth: radius * 2,
      //     minHeight: radius * 2,
      //   ),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: imageProvider,
      //       fit: BoxFit.cover,
      //     ),
      //     color: Colors.black26,
      //     shape: BoxShape.circle,
      //   ),
      // ),
      fit: BoxFit.scaleDown,
      placeholder: (_, __) => Container(
          height: radius * 2,
          width: radius * 2,
          alignment: Alignment.center,
          child: const CupertinoActivityIndicator()),
      errorWidget: (_, __, ___) => Center(
        child: CircleAvatar(
          radius: radius,
          backgroundImage:
              const AssetImage('assets/images/default-profile-image.jpg'),
        ),
      ),
    );
  }
}
