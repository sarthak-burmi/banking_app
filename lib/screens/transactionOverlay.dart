import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:banking_app/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransferOverlay extends StatefulWidget {
  const TransferOverlay({super.key});

  @override
  State<TransferOverlay> createState() => _TransferOverlayState();
}

class _TransferOverlayState extends State<TransferOverlay> {
  @override
  Widget build(BuildContext context) {
    //bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(20),
      ),
      height: height * 0.73,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Confirmation",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.015),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 240, 240, 240),
                          child: CircleAvatar(
                            foregroundImage:
                                const AssetImage("assets/images/DP_1.jpg"),
                          ),
                        ),
                        title: Row(
                          children: [
                            Text("Sarthak Burmi"),
                            Spacer(),
                            Text('₹3,23,567.94'),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text('*******0677'),
                            Spacer(),
                            Text('Balance'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 6, 0, 6),
                        child: Container(
                          height: height * 0.001,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 208, 207, 207),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 240, 240, 240),
                          child: SvgPicture.asset(
                            AppIcons.destination,
                            width: 26,
                            height: 26,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        title: const Row(
                          children: [
                            Text("Manav Rachna University"),
                          ],
                        ),
                        subtitle: const Row(
                          children: [
                            Text('MCA College Fee'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: width * 0.022),
                              SizedBox(
                                width: width * 0.65,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.010),
            const Row(
              children: [
                Text("Transfer Amount"),
                Spacer(),
                Text("₹99,201.34"),
              ],
            ),
            SizedBox(height: height * 0.010),
            const Row(
              children: [
                Text("Transaction type"),
                Spacer(),
                Text("Online Transfer"),
              ],
            ),
            SizedBox(height: height * 0.010),
            const Row(
              children: [
                Text("Transaction charges"),
                Spacer(),
                Text("₹56.90"),
              ],
            ),
            SizedBox(height: height * 0.010),
            const Row(
              children: [
                Text("Reward Points"),
                Spacer(),
                Text("x345 Points"),
              ],
            ),
            SizedBox(height: height * 0.025),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 49, 49, 49),
                    borderRadius: BorderRadius.circular(8)),
                width: width * 0.90,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Row(
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "₹99,258.24",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.040),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width * 0.9, height * 0.066),
                backgroundColor: appBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Next",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
