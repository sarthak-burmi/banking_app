import 'package:banking_app/widgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/appBar.dart';
import 'package:banking_app/widgets/bottomNavigation.dart';
import 'package:banking_app/widgets/transactions.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});
  @override
  State<AnalyticsPage> createState() => _AmalyticsPageState();
}

class _AmalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(
        preferredSize: Size(width, height * 0.097),
        showCircleAvatarProfilePic: false,
        pageTitle: "Analytics",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19, 10, 19, 9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 10, 19, 9),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Income this month",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: isDark ? white : black,
                                          fontWeight: FontWeight.w300),
                                ),
                                const Spacer(),
                                Text(
                                  "+ ₹2,20,132.87",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: isDark ? white : black,
                                          fontWeight: FontWeight.w300),
                                ),
                                const Icon(
                                  Icons.arrow_upward,
                                  color: green,
                                ),
                                SizedBox(height: height * 0.040),
                              ],
                            ),
                            Container(
                              height: height * 0.001,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 208, 207, 207),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(height: height * 0.040),
                                Text(
                                  "Expensed this month",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: isDark ? white : black,
                                          fontWeight: FontWeight.w300),
                                ),
                                const Spacer(),
                                Text(
                                  "- ₹1,00,571.97",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: isDark ? white : black,
                                          fontWeight: FontWeight.w300),
                                ),
                                const Icon(
                                  Icons.arrow_downward,
                                  color: red,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19, 10, 19, 9),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.390,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Month",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: isDark ? white : Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "December,2023",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: isDark ? white : black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_back_ios),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: GroupedBarChart.withSampleData()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.016),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 17, 0, 5),
                            child: Text(
                              "Recent Transactions",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: isDark ? white : black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
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
            bottom: 0,
            left: 0,
            right: 0,
            child: MyBottomAppBar(),
          ),
        ],
      ),
    );
  }
}
