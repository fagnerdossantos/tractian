import 'package:tractian/logic/interfaces/hierarchical_item.dart';
import 'package:tractian/logic/models/company.dart';

class Cache {
  //
  final List<HierarchicalItem> _tree = [];

  set saveTree(List<HierarchicalItem> items) => _tree.addAll(items);
  List<HierarchicalItem> get treeCache => List.unmodifiable(_tree);

  void clearTree() => _tree.clear();

  //
  final List<Company> _companies = [];

  set saveCompanies(List<Company> companies) => _companies.addAll(companies);
  List<Company> get companiesCache => List.unmodifiable(_companies);
}
