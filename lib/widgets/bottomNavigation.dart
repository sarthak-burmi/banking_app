import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({super.key});

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isRouteActive(String route) {
      return ModalRoute.of(context)?.settings.name == route;
    }

    return SizedBox(
      width: width,
      height: height * 0.097,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, height * 0.080),
            painter: BankCustomPainter(isDark),
          ),
          const Center(
            heightFactor: 0.8,
            child: MyCustomFABWithShadow(),
          ),
          SizedBox(
            width: width,
            height: height * 0.80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    if (_selectedIndex != 0) {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    }
                    Navigator.pushNamed(context, "/home");
                  },
                  icon: Column(
                    children: [
                      SizedBox(height: height * 0.010),
                      SvgPicture.asset(
                        'assets/icons/home-1-svgrepo-com.svg',
                        width: 30,
                        height: 34,
                        colorFilter: ColorFilter.mode(
                          isRouteActive("/home") ? appBlue : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        'Home',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: height * 0.02),
                ),
                IconButton(
                  onPressed: () {
                    if (_selectedIndex != 1) {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }
                    Navigator.pushNamed(context, "/analytics");
                  },
                  icon: Column(
                    children: [
                      SizedBox(height: height * 0.015),
                      SvgPicture.asset(
                        'assets/icons/analytics-svgrepo-com.svg',
                        width: 30,
                        height: 30,
                        colorFilter: ColorFilter.mode(
                          isRouteActive("/analytics") ? appBlue : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        'Analytics',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: height * 0.02),
                ),
                SizedBox(width: width * 0.20),
                IconButton(
                  onPressed: () {
                    if (_selectedIndex != 2) {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    }
                    Navigator.pushNamed(context, "/history");
                  },
                  icon: Column(
                    children: [
                      SizedBox(height: height * 0.012),
                      SvgPicture.asset(
                        'assets/icons/history-svgrepo-com.svg',
                        width: 30,
                        height: 34,
                        colorFilter: ColorFilter.mode(
                          isRouteActive("/history") ? appBlue : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        'History',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: height * 0.02),
                ),
                IconButton(
                  onPressed: () {
                    if (_selectedIndex != 3) {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }
                    Navigator.pushNamed(context, "/settings");
                  },
                  icon: Column(
                    children: [
                      SizedBox(height: height * 0.013),
                      SvgPicture.asset(
                        'assets/icons/settings-svgrepo-com.svg',
                        width: 30,
                        height: 34,
                        colorFilter: ColorFilter.mode(
                          isRouteActive("/settings") ? appBlue : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: height * 0.02),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BankCustomPainter extends CustomPainter {
  final bool isDark;

  BankCustomPainter(this.isDark);
  @override
  void paint(Canvas canvas, Size size) {
    Color backgroundColor = isDark
        ? const Color.fromARGB(152, 199, 199, 199)
        : const Color.fromARGB(255, 255, 255, 255);
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 9990);

    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0, 0);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);

    path.arcToPoint(Offset(size.width * 0.60, 22),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);

    path.lineTo(size.width, size.height);

    path.close();
    canvas.drawShadow(path, const Color.fromARGB(255, 15, 15, 15), 9.0, false);
    canvas.drawShadow(path, const Color.fromARGB(255, 15, 15, 15), 9.0, true);
    canvas.drawShadow(path, const Color.fromARGB(255, 15, 15, 15), 9.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyCustomFABWithShadow extends StatelessWidget {
  const MyCustomFABWithShadow({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 56.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: isDark ? Colors.white : appBlue,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.white.withOpacity(0.2)
                      : appBlue.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Icon(
              Icons.qr_code_scanner,
              size: 28,
              color: isDark ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
