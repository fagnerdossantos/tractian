import 'package:tractian/logic/models/asset.dart';
import 'package:tractian/logic/interfaces/hierarchical_item.dart';

final class Location implements HierarchicalItem<Location> {
  //
  @override
  final String id;

  @override
  final String? parentId;

  @override
  final String name;

  final List<Location> subLocations;
  @override
  void addSubItem({required subItem}) => subLocations.add(subItem);
  @override
  List<HierarchicalItem> getSubItems() => [...subLocations, ...assets];

  final List<Asset> assets;
  void addAsset(Asset asset) => assets.add(asset);

  Location({
    required this.id,
    required this.parentId,
    required this.name,
    required this.subLocations,
    required this.assets,
  });

  @override
  Location? hierarchyByStatus({required String status}) {
    //
    final List<Asset> assetsMatch = [];
    final List<Location> subLocationsMatch = [];

    for (Asset asset in assets) {
      assetsMatch.addAll(asset.hierarchyByStatus(status: status));
    }

    if (subLocations.isNotEmpty) {
      for (Location location in subLocations) {
        //
        final hasItem = location.hierarchyByStatus(status: status);

        if (hasItem != null) {
          subLocationsMatch.add(hasItem);
        }
      }
    }

    if (assetsMatch.isEmpty && subLocationsMatch.isEmpty) return null;

    return copyWith(
      subLocations: subLocationsMatch,
      assets: assetsMatch,
    );
  }

  // Copy and json
  Location copyWith({
    String? id,
    String? parentId,
    bool? isRoot,
    String? name,
    List<Location>? subLocations,
    List<Asset>? assets,
  }) {
    return Location(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      subLocations: subLocations ?? this.subLocations,
      assets: assets ?? this.assets,
    );
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'] as String,
      name: map['name'] as String,
      parentId: map['parentId'],
      subLocations: [],
      assets: [],
    );
  }
}
