import 'package:flutter/material.dart';

class BoxInfoCaption extends StatelessWidget {
  final int totalBoxes;
  final int boxCount;
  final Color color;
  final String label;

  const BoxInfoCaption({
    super.key,
    required this.boxCount,
    required this.totalBoxes,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final double percentageReceived = boxCount / totalBoxes * 100;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildColoredBoxCaption(color),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$boxCount pacotes',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${percentageReceived.round()}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColoredBoxCaption(Color color) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
