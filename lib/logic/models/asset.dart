import 'package:tractian/logic/interfaces/hierarchical_item.dart';

final class Asset implements HierarchicalItem {
  //
  @override
  final String id;

  @override
  final String? parentId;

  @override
  final String name;

  final String? locationId;
  final String? sensorType;

  final List<Asset> subAssets;
  @override
  void addSubItem({required subItem}) => subAssets.add(subItem);
  @override
  List<HierarchicalItem> getSubItems() => subAssets;

  Asset({
    required this.id,
    required this.name,
    required this.subAssets,
    this.parentId,
    this.locationId,
    this.sensorType,
    this.status,
  });

  final String? status;
  @override
  List<Asset> hierarchyByStatus({required String status}) {
    //
    List<Asset> matchPattern = [];

    // Check self state
    if (status == this.status) matchPattern.add(this);

    for (Asset subAsset in subAssets) {
      matchPattern.addAll(subAsset.hierarchyByStatus(status: status));
    }

    return matchPattern;
  }

  // Json
  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      name: map['name'] as String,
      locationId:
          map['locationId'] != null ? map['locationId'] as String : null,
      sensorType:
          map['sensorType'] != null ? map['sensorType'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      subAssets: [],
    );
  }
}
