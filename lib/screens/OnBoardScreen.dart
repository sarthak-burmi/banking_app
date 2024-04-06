import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: height * 0.50,
          width: width,
          color: appBlue,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 117, 103, 0),
            child: Align(
              child: Image.asset(
                height: height * 0.50,
                "assets/images/Background2.png",
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.030),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 155, 30),
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              children: [
                TextSpan(
                  text: 'PayWind',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: appBlue),
                ),
                TextSpan(
                  text: '\n\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'THE FUTURE OF\n',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                TextSpan(
                  text: 'MOBILE\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                TextSpan(
                  text: 'BANKING',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.020),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome, back ",
              style: TextStyle(color: appBlue, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: width * 0.012),
            CircleAvatar(
              radius: 13,
              backgroundColor: isDark ? lightGrey : white,
              foregroundImage: const AssetImage("assets/images/DP_1.jpg"),
            ),
            SizedBox(width: width * 0.010),
            const Text(
              "Sarthak Burmi",
              style: TextStyle(color: appBlue, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: height * 0.010),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width * 0.9, height * 0.066),
            backgroundColor: appBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text(
            "Next",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
          ),
        ),
      ],
    ));
  }
}
