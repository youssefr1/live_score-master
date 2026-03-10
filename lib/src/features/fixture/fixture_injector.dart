import 'package:live_score/src/container_injector.dart';
import 'package:live_score/src/core/api/dio_helper.dart';
import 'package:live_score/src/core/network/network_info.dart';
import 'package:live_score/src/features/fixture/data/data_sources/fixture_data_source.dart';
import 'package:live_score/src/features/fixture/data/repositories/fixture_repository_impl.dart';
import 'package:live_score/src/features/fixture/domain/use_cases/fixture_details_usecase.dart';
import 'package:live_score/src/features/fixture/domain/use_cases/statistics_usecase.dart';
import 'package:live_score/src/features/fixture/presentation/cubit/fixture_cubit.dart';

void initFixture() {
  sl.registerLazySingleton<FixtureDataSourceImpl>(
    () => FixtureDataSourceImpl(dioHelper: sl<DioHelper>()),
  );
  sl.registerLazySingleton(
    () => FixtureRepositoryImpl(
      networkInfo: sl<NetworkInfoImpl>(),
      fixtureDataSource: sl<FixtureDataSourceImpl>(),
    ),
  );
  sl.registerLazySingleton(
    () => StatisticsUseCase(fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerLazySingleton(
    () => FixtureDetailsUseCase(fixtureRepository: sl<FixtureRepositoryImpl>()),
  );
  sl.registerFactory(
    () => FixtureCubit(
      fixtureDetailsUseCase: sl<FixtureDetailsUseCase>(),
      statisticsUseCase: sl<StatisticsUseCase>(),
    ),
  );
}
