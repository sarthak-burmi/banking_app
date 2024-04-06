import 'package:banking_app/screens/transactionOverlay.dart';
import 'package:banking_app/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final List<String> beneficiaryAccount = [
    'Select Beneficiary',
    'MCA College Fee',
    'Papa SBI Account'
  ];
  String beneficiaryAccountDefault = 'Select Beneficiary';
  final List<String> accountNumber = [
    'Select Account Number',
    '0009124790511',
    '0123456780677',
    '0009134790511',
  ];
  String accountNumberDefault = 'Select Account Number';
  final TextEditingController transactionAmount = TextEditingController();
  Color backgroundColor = Colors.transparent;
  String text = ''; // Variable to hold the text entered via NumericKeyboard

  void onKeyboardTap(String value) {
    setState(() {
      text += value;
      transactionAmount.text = text;
    });
  }

  void _openTransferOvelay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => TransferOverlay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.097),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(27, 55, 27, 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: isDark ? lightGrey : white,
                    child: SvgPicture.asset(
                      AppIcons.back,
                      width: 26,
                      height: 26,
                      colorFilter: ColorFilter.mode(
                        isDark ? white : black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.2),
                Text(
                  "Transfer.",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Multiple?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: appBlue),
                    )),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19, 10, 19, 9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 15, 19, 9),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 240, 240, 240),
                                  child: SvgPicture.asset(
                                    AppIcons.bank,
                                    width: 26,
                                    height: 26,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: width * 0.026),
                                    SizedBox(
                                      width: width * 0.65,
                                      child: DropdownButtonFormField<String>(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        value: beneficiaryAccountDefault,
                                        onChanged: (String? value) {
                                          setState(() {
                                            beneficiaryAccountDefault = value!;
                                          });
                                        },
                                        items: beneficiaryAccount
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        decoration: const InputDecoration(
                                          labelText: 'Destination (To)',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 2, 0, 2),
                              child: Container(
                                height: height * 0.001,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 208, 207, 207),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 240, 240, 240),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: width * 0.026),
                                    SizedBox(
                                      width: width * 0.65,
                                      child: DropdownButtonFormField<String>(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        value: accountNumberDefault,
                                        onChanged: (String? value) {
                                          setState(() {
                                            accountNumberDefault = value!;
                                          });
                                        },
                                        items:
                                            accountNumber.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        decoration: const InputDecoration(
                                          labelText: 'Account Number (From)',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
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
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 9),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Enter Amount",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    cursorColor: appBlue,
                                    //readOnly: true,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9.]'),
                                      ),
                                    ],
                                    controller: transactionAmount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 30),
                                    decoration: InputDecoration(
                                      focusColor: appBlue,
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: appBlue,
                                          width: 2.0,
                                        ),
                                      ),
                                      prefix: Text(
                                        "₹",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 30),
                                      ),
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.020),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 172, 172, 172)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Text("₹10"),
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                              GestureDetector(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 172, 172, 172)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Text("₹20"),
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                              GestureDetector(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 172, 172, 172)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Text("₹30"),
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                              GestureDetector(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 172, 172, 172)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Text("₹40"),
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                              GestureDetector(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 172, 172, 172)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Text("₹50"),
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                            ],
                          ),
                        ),
                        NumericKeyboard(
                          onKeyboardTap: onKeyboardTap,
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                          ),
                          rightButtonFn: () {
                            if (text.isEmpty) return;
                            setState(() {
                              text = text.substring(0, text.length - 1);
                              transactionAmount.text = text;
                            });
                          },
                          rightButtonLongPressFn: () {
                            if (text.isEmpty) return;
                            setState(() {
                              text = '';
                              transactionAmount.text = '';
                            });
                          },
                          rightIcon: const Icon(
                            Icons.backspace_outlined,
                            color: appBlue,
                          ),
                          leftButtonFn: () {
                            setState(() {
                              text += '.';
                              transactionAmount.text = text;
                            });
                          },
                        ),
                        SizedBox(height: height * 0.05),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(width * 0.9, 50),
                            backgroundColor: appBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: _openTransferOvelay,
                          child: Text(
                            "Next",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
