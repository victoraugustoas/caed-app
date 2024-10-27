import 'package:caed_app/model/enums/package_status_enum.dart';
import 'package:flutter/material.dart';

class PackageRow extends StatelessWidget {
  final String code;
  final List<PackageStatus> status;

  const PackageRow({
    super.key,
    required this.code,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO add navigation
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(code, style: const TextStyle(fontSize: 18)),
                  _buildColumnStatus(),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  String statusDescription(PackageStatus status) {
    switch (status) {
      case PackageStatus.sent:
        return "Enviado";
      case PackageStatus.received:
        return "Recebido";
      case PackageStatus.returned:
        return "Devolução em andamento";
      case PackageStatus.returnedSuccess:
        return "Devolvido";
    }
  }

  Widget _buildColumnStatus() {
    return Wrap(
        spacing: 10,
        runSpacing: 5,
        children: status.map((s) => _buildStatus(s)).toList());
  }

  Widget _buildStatus(PackageStatus status) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle,
          size: 18,
          color: Colors.green.shade700,
        ),
        const SizedBox(width: 4),
        Text(
          statusDescription(status),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
