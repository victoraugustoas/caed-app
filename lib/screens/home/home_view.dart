import 'package:caed_app/global/container/dependency_injection.dart';
import 'package:caed_app/model/dto/package_data_dto.dart';
import 'package:caed_app/widgets/card_box_received/card_box_status.dart';
import 'package:caed_app/widgets/package_data.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final DependenciInjection container;

  const HomeView({super.key, required this.container});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              _buildHorizontalCardBox(),
              Expanded(child: _buildTabs()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCardBox() {
    return SizedBox(
      height: 220,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 320,
              child: CardPackageTypeStatus(
                type: PackageType.received,
                packageReceived: 1560,
                packageMissing: 440,
                colorStatus: Colors.lightBlue.shade300,
              ),
            ),
            SizedBox(
              width: 320,
              child: CardPackageTypeStatus(
                type: PackageType.returned,
                packageReceived: 1560,
                packageMissing: 440,
                colorStatus: Colors.lightBlue.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoxes() {
    return const Column();
  }

  Widget _buildTabs() {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(text: 'Pacotes'),
            Tab(text: 'Status'),
            Tab(text: 'Dados'),
          ],
        ),
        body: TabBarView(children: [
          Placeholder(),
          Placeholder(),
          PackageData(
            packageData: PackageDataDto(
              code: "BX1234",
              deliveryPoint: "Central Warehouse",
              city: "São Paulo",
              school: "Escola Estadual de São Paulo",
              schoolStage: "Ensino Médio",
              schoolSubject: "Matemática",
            ),
          )
        ]),
      ),
    );
  }
}
