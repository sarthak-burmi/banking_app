import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String pageTitle;
  final bool showCircleAvatarProfilePic;
  final bool showNotificationIcon;

  MyAppBar({
    required this.preferredSize,
    this.showCircleAvatarProfilePic = true,
    this.showNotificationIcon = true,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(27, 55, 27, 10),
          child: Row(
            children: [
              Text(
                pageTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (showNotificationIcon)
                CircleAvatar(
                  backgroundColor: isDark ? lightGrey : white,
                  child: SvgPicture.asset(
                    AppIcons.notificationBell,
                    width: 26,
                    height: 26,
                    colorFilter: ColorFilter.mode(
                      isDark ? white : black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              SizedBox(width: width * 0.04),
              if (showCircleAvatarProfilePic)
                CircleAvatar(
                  backgroundColor: isDark ? lightGrey : white,
                  foregroundImage: const AssetImage("assets/images/DP_1.jpg"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
