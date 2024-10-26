import 'package:caed_app/model/dto/box_data_dto.dart';
import 'package:flutter/material.dart';

class BoxData extends StatelessWidget {
  final BoxDataDto boxData;

  const BoxData({
    super.key,
    required this.boxData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Dados da caixa",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildRow('Código', boxData.code),
        _buildDivider(),
        _buildRow('Ponto de entrega', boxData.deliveryPoint),
        _buildDivider(),
        _buildRow('Município', boxData.city),
        _buildDivider(),
        _buildRow('Escola', boxData.school),
        _buildDivider(),
        _buildRow('Ano escolar/Etapa', boxData.schoolStage),
        _buildDivider(),
        _buildRow('Componente curricular', boxData.schoolSubject),
      ],
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
