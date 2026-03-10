import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/features/fixture/domain/entities/fixture_details.dart';
import 'package:live_score/src/features/fixture/domain/entities/statistics.dart';

abstract class FixtureRepository {
  Future<Either<Failure, Statistics>> getStatistics(int fixtureId);

  Future<Either<Failure, FixtureDetails>> getFixtureDetails(int fixtureId);
}
