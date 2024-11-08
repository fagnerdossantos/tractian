import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tractian/api/asset_service.dart';
import 'package:tractian/api/company_service.dart';
import 'package:tractian/api/location_service.dart';
import 'package:tractian/logic/controllers/cache.dart';
import 'package:tractian/logic/controllers/tree_controller.dart';
import 'package:tractian/logic/models/asset.dart';
import 'package:tractian/logic/models/location.dart';

import '../interfaces/hierarchical_item.dart';
import '../models/company.dart';

part 'tree_event.dart';
part 'tree_state.dart';

class TreeBloc extends Bloc<TreeEvent, TreeState> {
  //
  final CompanyService _companyService;
  final LocationService _locationService;
  final AssetService _assetService;
  final Cache _cache;

  TreeBloc(this._companyService, this._locationService, this._assetService,
      this._cache)
      : super(TreeInitial()) {
    //
    final controller = TreeController();

    //
    on<LoadCompanies>(
      (event, emit) async {
        //
        final companies = (await _companyService.fetch())
            .map(
              (map) => Company.fromMap(map),
            )
            .toList();

        emit(TreeHome(companies: companies));

        // Save in cache
        _cache.saveCompanies = companies;
      },
    );

    on<LoadTree>(
      (event, emit) async {
        //
        final locations = (await _locationService.fetch(id: event.companyId))
            .map((map) => Location.fromMap(map))
            .toList();

        final assets = (await _assetService.fetch(id: event.companyId))
            .map((map) => Asset.fromMap(map))
            .toList();

        //
        final List<HierarchicalItem> hierarchy = controller.build(
          locations,
          assets,
        );

        emit(TreeTreeView(hierarchy: hierarchy));

        // Save in hierarchy
        _cache.saveTree = hierarchy;
      },
    );

    on<FilteredTree>(
      (event, emit) {
        //
        final hierarchy = _cache.treeCache
            .map((e) => e.hierarchyByStatus(status: "alert") ?? [])
            .toList();

        final List<HierarchicalItem> newList = [];

        for (var item in hierarchy) {
          if (item is HierarchicalItem) {
            newList.add(item);
          }
        }

        emit(TreeTreeView(hierarchy: newList));
      },
    );

    on<BackHome>((_, emit) {
      emit(TreeHome(companies: _cache.companiesCache));
    });
  }
}
