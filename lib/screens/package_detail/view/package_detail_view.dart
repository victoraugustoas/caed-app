import 'package:caed_app/screens/package_detail/controller/package_details_controller.dart';
import 'package:caed_app/widgets/package_data.dart';
import 'package:caed_app/widgets/package_timelime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PackageDetailView extends ConsumerStatefulWidget {
  final String code;

  const PackageDetailView({
    super.key,
    required this.code,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PackageDetailViewState();
}

class _PackageDetailViewState extends ConsumerState<PackageDetailView> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(packageDetailsControllerProvider(widget.code));
    final state = controller.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pacote ${widget.code}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: controller.hasError
          ? const Center(child: Text('Ocorreu um erro'))
          : controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: const TabBar(
                        tabs: [
                          Tab(text: 'Status'),
                          Tab(text: 'Dados'),
                        ],
                      ),
                      body: TabBarView(children: [
                        PackageTimelime(
                          steps: state!.packageDetails!.status
                              .map(
                                (e) => TimelineStep(
                                  date: e.date,
                                  label: e.description,
                                ),
                              )
                              .toList(),
                        ),
                        PackageData(
                          packageData: state.packageDetails!.packageData,
                        )
                      ]),
                    ),
                  ),
                ),
    );
  }
}
