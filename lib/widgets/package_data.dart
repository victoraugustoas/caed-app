import 'package:caed_app/model/dto/package_data_dto.dart';
import 'package:flutter/material.dart';

class PackageData extends StatelessWidget {
  final PackageDataDto packageData;

  const PackageData({
    super.key,
    required this.packageData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dados da caixa",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildRow('Código', packageData.code),
          _buildDivider(),
          _buildRow('Ponto de entrega', packageData.deliveryPoint),
          _buildDivider(),
          _buildRow('Município', packageData.city),
          _buildDivider(),
          _buildRow('Escola', packageData.school),
          _buildDivider(),
          _buildRow('Ano escolar/Etapa', packageData.schoolStage),
          _buildDivider(),
          _buildRow('Componente curricular', packageData.schoolSubject),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      children: [
        Expanded(child: Text(label.toUpperCase())),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 2, color: Colors.grey.shade400),
    );
  }
}
