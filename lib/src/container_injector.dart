import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:live_score/src/core/api/dio_helper.dart';
import 'package:live_score/src/core/api/interceptors.dart';
import 'package:live_score/src/core/network/network_info.dart';
import 'package:live_score/src/features/fixture/fixture_injector.dart';
import 'package:live_score/src/features/soccer/soccer_injector.dart';

final sl = GetIt.instance;

void initApp() {
  initCore();
  initSoccer();
  initFixture();
}

void initCore() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());

  sl.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  sl.registerLazySingleton<DioHelper>(() => DioHelper(dio: sl<Dio>()));
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(
      addresses: [
        AddressCheckOption(uri: Uri.parse('https://www.google.com')),
        AddressCheckOption(uri: Uri.parse('https://www.bing.com')),
        AddressCheckOption(uri: Uri.parse('https://www.amazon.com')),
      ],
    ),
  );
  sl.registerLazySingleton<NetworkInfoImpl>(
    () => NetworkInfoImpl(connectionChecker: sl<InternetConnectionChecker>()),
  );
}
