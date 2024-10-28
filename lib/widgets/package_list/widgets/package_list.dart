import 'package:caed_app/global/container/dependency_injection.dart';
import 'package:caed_app/routes/routes.dart';
import 'package:caed_app/widgets/package_list/controller/package_list_controller.dart';
import 'package:caed_app/widgets/package_list/widgets/package_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PackageList extends ConsumerStatefulWidget {
  final DependenciInjection container;

  const PackageList({
    super.key,
    required this.container,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PackageListState();
}

class _PackageListState extends ConsumerState<PackageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final state = ref.watch(packageListControllerProvider);
      final packageList = state.value!.packageList;
      final page = state.value!.page;
      final setPage = ref.read(packageListControllerProvider.notifier).setPage;

      final pageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      final totalItemsToShow = packageList?.numberOfElements ?? 0;
      final getNextPage =
          ((packageList?.pageSize ?? 10) * (page + 1)) < totalItemsToShow;

      if (_scrollController.position.pixels > pageTrigger &&
          getNextPage &&
          state.isLoading == false) {
        setPage(page + 1);
        ref.read(packageListControllerProvider.notifier).fetch();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(packageListControllerProvider);

    return state.hasError
        ? const Center(
            child: Text('Ocorreu um erro'),
          )
        : state.value!.firstLoading
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(width: 8),
                      Text(
                        'Lista de pacotes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 1),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: ref
                          .read(packageListControllerProvider.notifier)
                          .onRefresh,
                      child: ListView.separated(
                        controller: _scrollController,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final package =
                              state.value!.packageList!.content[index];
                          return PackageRow(
                            code: package.code,
                            status: package.status,
                            onPressed: () =>
                                PackageDetailRoute(code: package.code)
                                    .push(context),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return _buildDivider();
                        },
                        itemCount: state.value!.packageList!.content.length,
                      ),
                    ),
                  ),
                  if (state.isLoading)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              );
  }

  Widget _buildDivider() {
    return Divider(height: 3, color: Colors.grey.shade400);
  }
}
