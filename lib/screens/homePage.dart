import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/appBar.dart';
import 'package:banking_app/widgets/bottomNavigation.dart';
import 'package:banking_app/widgets/cards.dart';
import 'package:banking_app/widgets/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(
        preferredSize: Size(width, height * 0.097),
        pageTitle: "PayWind.",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height * 0.270,
                    child: const CardDisplay(),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/transfer");
                        },
                        child: Container(
                          height: height * 0.056,
                          width: width * 0.36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: isDark ? white : black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 13, 0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/transfer-vertical-svgrepo-com.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(width: width * 0.020),
                                Text(
                                  "Transfer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: isDark ? black : white,
                                        fontSize: 20,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.056,
                        width: width * 0.37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: isDark ? black : white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 13, 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/receipt-svgrepo-com.svg',
                                width: 24,
                                height: 24,
                              ),
                              // const Icon(
                              //   Icons.money,
                              //   color: black,
                              // ),
                              SizedBox(width: width * 0.026),
                              Text(
                                "Payment",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: isDark ? white : black,
                                      fontSize: 20,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: white,
                        child: SvgPicture.asset(
                          'assets/icons/apps-svgrepo-com.svg',
                          width: 24,
                          height: 24,
                        ),
                        // child: Icon(
                        //   Icons.apps_rounded,
                        //   size: 30,
                        // ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.016,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 17, 0, 5),
                            child: Text(
                              "Favourite Transactions",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: isDark ? white : black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                            ),
                          ),
                        ),
                        Column(
                          children: transactions.map((transactions) {
                            return TransactionItem(transaction: transactions);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.87),
          const Positioned(
            //top: 735,
            bottom: 0,
            left: 0,
            right: 0,
            child: MyBottomAppBar(),
          )
        ],
      ),
    );
  }
}
