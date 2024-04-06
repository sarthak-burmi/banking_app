import 'package:banking_app/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        child: transaction.tranIcon,
      ),
      title: Row(
        children: [
          Text(transaction.name),
          const Spacer(),
          Text('Amount: ${transaction.amount}'),
        ],
      ),
      subtitle: Row(
        children: [
          Text('Date: ${transaction.date}'),
          const Spacer(),
          Text('Time: ${transaction.time}'),
        ],
      ),
    );
  }
}

class Transaction {
  final String name;
  final double amount;
  final String date;
  final String time;
  final Widget tranIcon;

  Transaction({
    required this.name,
    required this.amount,
    required this.date,
    required this.time,
    required this.tranIcon,
  });
}

final List<Transaction> transactions = [
  Transaction(
    name: 'Groceries',
    amount: 500.0,
    date: '2022-01-20',
    time: '10:30 AM',
    tranIcon: SvgPicture.asset(
      AppIcons.shoppingCart,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
  Transaction(
    name: 'Dinner',
    amount: 8500.0,
    date: '2022-01-19',
    time: '07:00 PM',
    tranIcon: SvgPicture.asset(
      AppIcons.food,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
  Transaction(
    name: 'Intrest on Saving',
    amount: 2340.0,
    date: '2022-01-19',
    time: '07:00 PM',
    tranIcon: SvgPicture.asset(
      AppIcons.bank,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
  Transaction(
    name: 'Netflix',
    amount: 899.0,
    date: '2022-01-19',
    time: '07:00 PM',
    tranIcon: SvgPicture.asset(
      AppIcons.entertainment,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
  Transaction(
    name: 'Sony Entertainment',
    amount: 3599.0,
    date: '2022-01-19',
    time: '07:00 PM',
    tranIcon: SvgPicture.asset(
      AppIcons.game,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
  Transaction(
    name: 'Disney + Hotstar',
    amount: 799.0,
    date: '2022-01-19',
    time: '07:00 PM',
    tranIcon: SvgPicture.asset(
      AppIcons.entertainment,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
  Transaction(
    name: 'Cloths',
    amount: 2600.0,
    date: '2022-01-19',
    time: '07:00 PM',
    tranIcon: SvgPicture.asset(
      AppIcons.cloths,
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
    ),
  ),
];
