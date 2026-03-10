import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/domain/entities/league.dart';
import 'package:live_score/src/core/domain/entities/soccer_fixture.dart';
import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/features/soccer/domain/entities/standings.dart';
import 'package:live_score/src/features/soccer/domain/use_cases/standings_usecase.dart';

abstract class SoccerRepository {
  Future<Either<Failure, List<League>>> getLeagues();

  Future<Either<Failure, List<SoccerFixture>>> getCurrentRoundFixtures({
    required int competitionId,
  });

  Future<Either<Failure, List<SoccerFixture>>> getTodayFixtures();

  Future<Either<Failure, Standings>> getStandings({
    required StandingsParams params,
  });
}
