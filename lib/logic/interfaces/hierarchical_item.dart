// abstract interface class HierarchicalItem<T> {
//   final String id, name;
//   final String? parentId;

//   void addSubItem({required T subItem});
//   List<HierarchicalItem> getSubItems();
//   List<T> hierarchyByStatus({required String status});

//   HierarchicalItem({
//     required this.id,
//     required this.name,
//     required this.parentId,
//   });
// }

abstract interface class HierarchicalItem<T> {
  final String id, name;
  final String? parentId;

  void addSubItem({required T subItem});
  List<HierarchicalItem> getSubItems();
  T? hierarchyByStatus({required String status});

  HierarchicalItem({
    required this.id,
    required this.name,
    required this.parentId,
  });
}
