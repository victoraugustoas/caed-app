import 'package:flutter/material.dart';

class PackageInfoCaption extends StatelessWidget {
  final int totalPackages;
  final int packageCount;
  final Color color;
  final String label;

  const PackageInfoCaption({
    super.key,
    required this.packageCount,
    required this.totalPackages,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final double percentageReceived = packageCount / totalPackages * 100;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildColoredPackageCaption(color),
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
                    '$packageCount pacotes',
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

  Widget _buildColoredPackageCaption(Color color) {
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
