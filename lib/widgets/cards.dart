import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDisplay extends StatefulWidget {
  const CardDisplay({super.key});

  @override
  State<CardDisplay> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
            width: width * 0.60,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/CardBack.png",
                            height: height * 0.18,
                            width: width * 0.60,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: height * 0.001,
                      left: width * 0.020,
                      right: width * 0.020,
                      bottom: height * 0.001,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/Card Chip.png",
                                height: height * 0.070,
                                width: width * 0.10,
                              ),
                              SizedBox(width: width * 0.010),
                              Image.asset(
                                "assets/images/Tap To Pay.png",
                                height: height * 0.070,
                                width: width * 0.06,
                                color: white,
                              ),
                              const Spacer(),
                              Image.asset(
                                "assets/images/Visa Logo.png",
                                height: height * 0.070,
                                width: width * 0.16,
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.014),
                          Row(
                            children: [
                              Text(
                                "Balance",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(
                                          255, 214, 214, 214),
                                      fontSize: 19,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "₹3,23,567.94",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: isDark ? black : white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.hidePass,
                                width: 24,
                                height: 24,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                  child: Row(
                    children: [
                      Text(
                        "Card Number",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: isDark ? white : Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      Text(
                        "Vaild Thru",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: isDark ? white : Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Row(
                    children: [
                      Text(
                        "****0677",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: isDark ? white : black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        "03/25",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: isDark ? white : black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
