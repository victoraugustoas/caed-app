import 'package:caed_app/widgets/card_box_received/package_info_caption.dart';
import 'package:flutter/material.dart';

enum PackageStatusType { received, returned }

class CardPackageTypeStatus extends StatelessWidget {
  final int packageReceived;
  final int packageMissing;
  final PackageStatusType status;
  final Color colorStatus;

  CardPackageTypeStatus({
    super.key,
    required this.packageMissing,
    required this.packageReceived,
    required this.status,
    required this.colorStatus,
  });

  final Color colorBoxMissing = Colors.grey.shade400;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            _buildProgressBar(),
            const SizedBox(height: 16),
            Expanded(child: _buildCaption())
          ],
        ),
      ),
    );
  }

  String get title {
    switch (status) {
      case PackageStatusType.received:
        return 'Recebimento de pacotes';
      case PackageStatusType.returned:
        return 'Devolução de pacotes';
    }
  }

  String get titleCaption {
    switch (status) {
      case PackageStatusType.received:
        return 'Recebidos';
      case PackageStatusType.returned:
        return 'Devolvidos';
    }
  }

  Widget _buildProgressBar() {
    const double height = 40;
    return Row(
      children: [
        Expanded(
          flex: packageReceived,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: colorStatus,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: packageMissing,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: colorBoxMissing,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCaption() {
    return Column(
      children: [
        _buildInfoCaption(
          titleCaption,
          packageReceived,
          colorStatus,
        ),
        const Spacer(),
        _buildInfoCaption(
          'Faltantes',
          packageMissing,
          colorBoxMissing,
        ),
      ],
    );
  }

  Widget _buildInfoCaption(String label, int packageCount, Color color) {
    final int totalPackages = packageMissing + packageReceived;

    return PackageInfoCaption(
      packageCount: packageCount,
      color: color,
      label: label,
      totalPackages: totalPackages,
    );
  }
}
