import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../interfaces/hierarchical_item.dart';
import '../models/company.dart';

part 'tree_event.dart';
part 'tree_state.dart';

class TreeBloc extends Bloc<TreeEvent, TreeState> {
  TreeBloc() : super(TreeInitial()) {
    //
    on<TreeEvent>((event, emit) {});
  }
}
