import 'package:caed_app/utils/extensions/date_ext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimelineStep {
  String label;
  DateTime date;

  TimelineStep({required this.date, required this.label});
}

class PackageTimelime extends StatelessWidget {
  final List<TimelineStep> steps;

  const PackageTimelime({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Status da caixa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: steps
                      .map((step) => _buildStep(step.date, step.label))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(DateTime date, String label) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date.format(DateFormat.yMd())),
              Text(date.format(DateFormat.Hm())),
            ],
          ),
          Expanded(
            flex: 2,
            child: _buildTimelineIndicator(),
          ),
          Expanded(
            flex: 9,
            child: Text(label),
          )
        ],
      ),
    );
  }

  Widget _buildTimelineIndicator() {
    final colors = [
      Colors.green,
      Colors.lightBlue.shade300,
      Colors.blue,
      Colors.lightGreen,
    ];
    colors.shuffle();

    return RotatedBox(
      quarterTurns: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(),
          Icon(
            Icons.circle,
            size: 20,
            color: colors[0],
          ),
        ],
      ),
    );
  }
}
