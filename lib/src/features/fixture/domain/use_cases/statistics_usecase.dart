import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/usecase/usecase.dart';
import 'package:live_score/src/features/fixture/domain/entities/statistics.dart';
import 'package:live_score/src/features/fixture/domain/repositories/fixture_repository.dart';

class StatisticsUseCase implements UseCase<Statistics, int> {
  final FixtureRepository fixtureRepository;

  StatisticsUseCase({required this.fixtureRepository});

  @override
  Future<Either<Failure, Statistics>> call(int params) async {
    return await fixtureRepository.getStatistics(params);
  }
}
