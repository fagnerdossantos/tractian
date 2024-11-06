part of 'tree_bloc.dart';

@immutable
sealed class TreeState {}

final class TreeInitial extends TreeState {}

final class TreeLoading extends TreeState {}

final class TreeHome extends TreeState {
  final List<Company> companies;

  TreeHome({required this.companies});
}

final class TreeTreeView extends TreeState {
  final List<HierarchicalItem> locations;

  TreeTreeView({required this.locations});
}
