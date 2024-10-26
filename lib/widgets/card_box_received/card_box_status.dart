import 'package:caed_app/widgets/card_box_received/box_info_caption.dart';
import 'package:flutter/material.dart';

enum BoxType { received, returned }

class CardBoxTypeStatus extends StatelessWidget {
  final int boxReceived;
  final int boxMissing;
  final BoxType type;
  final Color colorStatus;

  CardBoxTypeStatus({
    super.key,
    required this.boxMissing,
    required this.boxReceived,
    required this.type,
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
    switch (type) {
      case BoxType.received:
        return 'Recebimento de pacotes';
      case BoxType.returned:
        return 'Devolução de pacotes';
    }
  }

  String get titleCaption {
    switch (type) {
      case BoxType.received:
        return 'Recebidos';
      case BoxType.returned:
        return 'Devolvidos';
    }
  }

  Widget _buildProgressBar() {
    const double height = 40;
    return Row(
      children: [
        Expanded(
          flex: boxReceived,
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
          flex: boxMissing,
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
          boxReceived,
          colorStatus,
        ),
        const Spacer(),
        _buildInfoCaption(
          'Faltantes',
          boxMissing,
          colorBoxMissing,
        ),
      ],
    );
  }

  Widget _buildInfoCaption(String label, int boxCount, Color color) {
    final int totalBoxes = boxMissing + boxReceived;

    return BoxInfoCaption(
      boxCount: boxCount,
      color: color,
      label: label,
      totalBoxes: totalBoxes,
    );
  }
}
