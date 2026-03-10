import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:live_score/src/core/domain/entities/league.dart';
import 'package:live_score/src/core/domain/entities/soccer_fixture.dart';
import 'package:live_score/src/core/domain/mappers/mappers.dart';
import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/error/response_status.dart';
import 'package:live_score/src/core/network/network_info.dart';
import 'package:live_score/src/features/soccer/data/datasources/soccer_data_source.dart';
import 'package:live_score/src/features/soccer/domain/entities/standings.dart';
import 'package:live_score/src/features/soccer/domain/repositories/soccer_repository.dart';
import 'package:live_score/src/features/soccer/domain/use_cases/standings_usecase.dart';

class SoccerRepositoryImpl implements SoccerRepository {
  final SoccerDataSource soccerDataSource;
  final NetworkInfo networkInfo;

  SoccerRepositoryImpl({
    required this.soccerDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<SoccerFixture>>> getCurrentRoundFixtures({
    required int competitionId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await soccerDataSource.getCurrentRoundFixtures(
          competitionId: competitionId,
        );
        final List<SoccerFixture> fixtures =
            result.map((fixture) => fixture.toDomain()).toList();
        return Right(fixtures);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<League>>> getLeagues() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await soccerDataSource.getLeagues();
        final List<League> leagues =
            result.map((league) => league.toDomain()).toList();
        return Right(leagues);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<SoccerFixture>>> getTodayFixtures() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await soccerDataSource.getTodayFixtures();
        final List<SoccerFixture> fixtures =
            result.map((fixture) => fixture.toDomain()).toList();
        return Right(fixtures);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }

  @override
  Future<Either<Failure, Standings>> getStandings({
    required StandingsParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await soccerDataSource.getStandings(params: params);
        final Standings standings = result;
        return Right(standings);
      } on DioException catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.networkConnectError.getFailure());
    }
  }
}
