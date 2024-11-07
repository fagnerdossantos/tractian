import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/logic/bloc/tree_bloc.dart';
import 'package:tractian/logic/providers/app_instancies.dart';
import 'package:tractian/presentation/views/asset_tree_view.dart';
import 'package:tractian/presentation/views/home_view.dart';

class ViewsBuilder extends StatefulWidget {
  const ViewsBuilder({super.key});

  @override
  State<ViewsBuilder> createState() => _ViewsBuilderState();
}

class _ViewsBuilderState extends State<ViewsBuilder> {
  //
  final TreeBloc bloc = getIt<TreeBloc>();

  @override
  void initState() {
    bloc.add(LoadCompanies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreeBloc, TreeState>(
      //
      bloc: bloc,
      builder: (_, state) {
        return switch (state) {
          TreeHome(companies: final c) => HomeView(companies: c),
          TreeTreeView(hierarchy: final h) => AssetTreeView(hierarchy: h),
          _ => const SizedBox(),
        };
      },
    );
  }
}
