//
import 'package:get_it/get_it.dart';
import 'package:tractian/api/asset_service.dart';
import 'package:tractian/api/company_service.dart';
import 'package:tractian/api/location_service.dart';
import 'package:tractian/logic/bloc/tree_bloc.dart';
import 'package:tractian/logic/controllers/cache.dart';

final GetIt getIt = GetIt.instance;

class AppInstancies {
  //
  void register() {
    // Services
    getIt.registerLazySingleton(() => CompanyService());
    getIt.registerLazySingleton(() => LocationService());
    getIt.registerLazySingleton(() => AssetService());

    // Cache
    getIt.registerLazySingleton(() => Cache());

    // Blocs
    getIt.registerSingleton(
      TreeBloc(
        getIt<CompanyService>(),
        getIt<LocationService>(),
        getIt<AssetService>(),
        getIt<Cache>(),
      ),
    );
  }
}
