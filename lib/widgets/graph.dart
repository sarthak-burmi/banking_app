import 'package:banking_app/model/expenseAndincomeModel.dart';
import 'package:banking_app/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<IncomeAndExpense, String>> seriesList;
  final bool animate;

  const GroupedBarChart(
    this.seriesList, {
    Key? key,
    required this.animate,
  }) : super(key: key);

  factory GroupedBarChart.withSampleData() {
    return GroupedBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
          horizontalFirst: true,
          cellPadding: const EdgeInsets.all(4.0),
          showMeasures: true,
          measureFormatter: (num? value) {
            return value == null ? '-' : '${value.toInt()}';
          },
        ),
      ],
    );
  }

  static List<charts.Series<IncomeAndExpense, String>> _createSampleData() {
    final data = [
      IncomeAndExpense(
        week: 'Week 1',
        incomeAmount: 50400,
        expenditureAmount: 18567,
        month: "December",
        year: 2023,
      ),
      IncomeAndExpense(
        week: 'Week 2',
        incomeAmount: 54353,
        expenditureAmount: 10450,
        month: "December",
        year: 2023,
      ),
      IncomeAndExpense(
        week: 'Week 3',
        incomeAmount: 44480,
        expenditureAmount: 25678,
        month: "December",
        year: 2023,
      ),
      IncomeAndExpense(
        week: 'Week 4',
        incomeAmount: 70899,
        expenditureAmount: 45876,
        month: "December",
        year: 2023,
      ),
    ];

    return [
      charts.Series<IncomeAndExpense, String>(
        id: 'Income',
        domainFn: (IncomeAndExpense sales, _) => sales.week,
        measureFn: (IncomeAndExpense sales, _) => sales.incomeAmount,
        data: data,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(appBlue),
      ),
      charts.Series<IncomeAndExpense, String>(
        id: 'Expenditure',
        domainFn: (IncomeAndExpense sales, _) => sales.week,
        measureFn: (IncomeAndExpense sales, _) => sales.expenditureAmount,
        data: data,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(lightappBlue),
      ),
    ];
  }
}
