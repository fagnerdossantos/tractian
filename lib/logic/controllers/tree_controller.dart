import '../interfaces/hierarchical_item.dart';
import '../models/asset.dart';
import '../models/location.dart';

class TreeController {
  //
  bool isEnergySensor(HierarchicalItem item) {
    return switch (item) { Asset(sensorType: "energy") => true, _ => false };
  }

  bool isSensorCritical(HierarchicalItem item) {
    return switch (item) { Asset(status: "alert") => true, _ => false };
  }

  String itemToImage(HierarchicalItem item) {
    return switch (item) {
      Location() => 'assets/icons/location.png',
      Asset(sensorType: != null) => 'assets/icons/component.png',
      _ => 'assets/icons/asset.png',
    };
  }

  //
  List<HierarchicalItem> build(List<Location> locations, List<Asset> assets) {
    //
    final locationById = {for (Location map in locations) map.id: map};
    final assetById = {for (Asset map in assets) map.id: map};

    final List<HierarchicalItem> rootItems = [];

    // Create assets hierarchy
    for (Asset asset in assets) {
      if (asset.parentId != null) {
        final parentAsset = assetById[asset.parentId];

        parentAsset?.addSubItem(subItem: asset);
      }
    }

    // Create assets to locations hierarchy
    for (Asset asset in assets) {
      if (asset.locationId != null) {
        final parentLocation = locationById[asset.locationId];

        parentLocation?.addAsset(asset);
      }
    }

    // Create Local to Local hierarchy
    for (Location location in locations) {
      if (location.parentId == null) {
        rootItems.add(location);
      } else {
        final parentLocation = locationById[location.parentId];

        parentLocation?.addSubItem(subItem: location);
      }
    }

    // Create assets with no parents
    for (Asset asset in assets) {
      if (asset.parentId == null && asset.locationId == null) {
        rootItems.add(asset);
      }
    }

    //
    return rootItems;
  }
}
