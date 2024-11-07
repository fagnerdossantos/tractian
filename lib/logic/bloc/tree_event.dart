part of 'tree_bloc.dart';

@immutable
sealed class TreeEvent {}

final class LoadCompanies extends TreeEvent {}

final class LoadTree extends TreeEvent {
  final String companyId;

  LoadTree({required this.companyId});
}

final class FilteredTree extends TreeEvent {
  final FilterType type;

  FilteredTree({required this.type});
}

enum FilterType {
  energy,
  critical;
}
