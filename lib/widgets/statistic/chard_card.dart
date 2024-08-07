import 'package:anx_reader/l10n/localization_extension.dart';
import 'package:anx_reader/widgets/statistic/week_month_year_widget.dart';
import 'package:flutter/material.dart';


enum ChartMode { week, month, year }

class ChartCard extends StatefulWidget {
  const ChartCard({super.key});

  @override
  _ChartCardState createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  ChartMode _currentMode = ChartMode.week;
  Widget currentChart = const WeekWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _chartModeButton(ChartMode.week, context.statisticWeek),
                  const SizedBox(width: 10),
                  _chartModeButton(ChartMode.month, context.statisticMonth),
                  const SizedBox(width: 10),
                  _chartModeButton(ChartMode.year, context.statisticYear),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: currentChart,
            )
          ],
        ),
      ),
    );
  }

  Widget _chartModeButton(ChartMode mode, String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _currentMode = mode;
            switch (mode) {
              case ChartMode.week:
                currentChart = const WeekWidget();

                break;
              case ChartMode.month:
                currentChart = const MonthWidget();
                break;
              case ChartMode.year:
                currentChart = const YearWidget();
                break;
            }
          });
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (_currentMode == mode) {
                return Theme
                    .of(context)
                    .colorScheme
                    .primary;
              }
              return Theme
                  .of(context)
                  .colorScheme
                  .surface;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (_currentMode == mode) {
                return Theme
                    .of(context)
                    .colorScheme
                    .onPrimary;
              }
              return Theme
                  .of(context)
                  .colorScheme
                  .onSurface;
            },
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

