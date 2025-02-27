import 'package:appwrite/appwrite.dart';
import 'package:appwrite_flutter_sample/repositories/data_repo.dart';
import 'package:get_it/get_it.dart';

class AppInjections {
  static setUpLocators() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<Client>(() => Client()
        .setProject('67c0262f003445fe3974')
        .setSelfSigned(status: true));

    getIt.registerLazySingleton<Databases>(() => Databases(getIt<Client>()));
    getIt.registerLazySingleton<DataRepo>(() => DataRepo());
  }
}
