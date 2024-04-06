import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/appBar.dart';
import 'package:banking_app/widgets/bottomNavigation.dart';
import 'package:banking_app/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: MyAppBar(
        preferredSize: Size(width, height * 0.097),
        showCircleAvatarProfilePic: false,
        showNotificationIcon: false,
        pageTitle: "Settings",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 14, 19, 9),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundColor: isDark ? lightGrey : white,
                                  foregroundImage: const AssetImage(
                                      "assets/images/DP_1.jpg"),
                                ),
                                SizedBox(width: width * 0.030),
                                Text(
                                  "Sarthak Burmi\nsarthak09burmi@gmail.com",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: const Color.fromARGB(
                                            255, 29, 29, 29),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: appBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Edit",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    height: height * 0.044,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "General",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.010),
                  Column(
                    children:
                        items.map((item) => GeneralItem(items: item)).toList(),
                  ),
                  SizedBox(height: height * 0.010),
                  Container(
                    height: height * 0.044,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "Security",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.010),
                  Column(
                    children: securityitems
                        .map((securityitems) =>
                            SecurityItem(securityitems: securityitems))
                        .toList(),
                  ),
                  SizedBox(height: height * 0.090),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.89),
          const Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: MyBottomAppBar(),
          )
        ],
      ),
    );
  }
}

class GeneralItem extends StatelessWidget {
  final GenralItemslist items;
  const GeneralItem({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              items.icons,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                appBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (items.status == "") const SizedBox(height: 18),
          Text(
            items.name,
          ), // Always show items.name
        ],
      ),
      subtitle: Row(
        children: [
          Text(items.status),
          const Spacer(),
        ],
      ),
    );
  }
}

class GenralItemslist {
  final String name;
  final String status;
  final String icons;

  GenralItemslist({
    required this.name,
    required this.status,
    required this.icons,
  });
}

final List<GenralItemslist> items = [
  GenralItemslist(
    name: 'Notification',
    status: "on",
    icons: AppIcons.notificationBell,
  ),
  GenralItemslist(
    name: 'Appearance',
    status: "Same as Device",
    icons: AppIcons.appearance,
  ),
  GenralItemslist(
    name: 'Language',
    status: "English",
    icons: AppIcons.language,
  ),
  GenralItemslist(
    name: 'Our Agreements',
    status: "",
    icons: AppIcons.agreement,
  ),
  GenralItemslist(
    name: 'About us',
    status: "",
    icons: AppIcons.questionMark,
  ),
];

/////////////////
//////
///
class SecurityItem extends StatelessWidget {
  final GenralItemslist securityitems;
  const SecurityItem({
    super.key,
    required this.securityitems,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              securityitems.icons,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                appBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (securityitems.status == "") const SizedBox(height: 18),
          Text(securityitems.name), // Always show items.name
        ],
      ),
      subtitle: Row(
        children: [
          Text(securityitems.status),
          const Spacer(),
        ],
      ),
    );
  }
}

class SecurityItemlist {
  final String name;
  final String status;
  final String icons;

  SecurityItemlist({
    required this.name,
    required this.status,
    required this.icons,
  });
}

final List<GenralItemslist> securityitems = [
  GenralItemslist(
    name: 'Change Password',
    status: "",
    icons: AppIcons.password,
  ),
  GenralItemslist(
    name: 'Active FaceID',
    status: "Active",
    icons: AppIcons.faceId,
  ),
  GenralItemslist(
    name: 'Logout',
    status: "",
    icons: AppIcons.logOut,
  ),
  // GenralItemslist(
  //   name: 'Our Agreements',
  //   status: "",
  //   icons: AppIcons.agreement,
  // ),
  // GenralItemslist(
  //   name: 'About us',
  //   status: "",
  //   icons: AppIcons.questionMark,
  // ),
];
