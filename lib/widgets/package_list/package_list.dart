import 'package:caed_app/global/container/dependency_injection.dart';
import 'package:caed_app/model/dto/package_list_dto.dart';
import 'package:caed_app/network/providers/packages_data_provider.dart';
import 'package:caed_app/widgets/package_list/package_row.dart';
import 'package:flutter/material.dart';

class PackageList extends StatefulWidget {
  final DependenciInjection container;

  const PackageList({
    super.key,
    required this.container,
  });

  @override
  State<PackageList> createState() => _PackageListState();
}

class _PackageListState extends State<PackageList> {
  // TODO fix dispose to return at previous state

  bool _loading = true;
  bool _firstLoading = true;
  int _page = 0;
  PackageListDto? packageListDto;
  final ScrollController _scrollController = ScrollController();

  int get page => _page;
  set page(int value) => setState(() => _page = value);

  bool get firstLoading => _firstLoading;
  set firstLoading(bool value) => setState(() => _firstLoading = value);

  bool get loading => _loading;
  set loading(bool value) => setState(() => _loading = value);

  @override
  void initState() {
    super.initState();
    fetchList();
    _scrollController.addListener(() {
      final pageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      final totalItemsToShow = packageListDto?.numberOfElements ?? 0;
      final getNextPage =
          ((packageListDto?.pageSize ?? 10) * (page + 1)) < totalItemsToShow;

      if (_scrollController.position.pixels > pageTrigger &&
          getNextPage &&
          loading == false) {
        page += 1;
        fetchList();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchList() async {
    try {
      loading = true;
      final response =
          await widget.container.find<PackagesDataProvider>().list(10, page);
      if (packageListDto != null) {
        final withResponse = response.copyWith(content: [
          ...packageListDto!.content,
          ...response.content,
        ]);
        setState(() {
          packageListDto = withResponse;
        });
      } else {
        setState(() {
          packageListDto = response;
        });
      }
    } catch (e) {
      // TODO catch error
    } finally {
      loading = false;
      firstLoading = false;
    }
  }

  Future<void> onRefresh() async {
    page = 0;
    loading = true;
    firstLoading = true;
    setState(() {
      packageListDto = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return firstLoading
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
                  onRefresh: onRefresh,
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final package = packageListDto!.content[index];
                      return PackageRow(
                        code: package.code,
                        status: package.status,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return _buildDivider();
                    },
                    itemCount: packageListDto!.content.length,
                  ),
                ),
              )
            ],
          );
  }

  Widget _buildDivider() {
    return Divider(height: 3, color: Colors.grey.shade400);
  }
}
