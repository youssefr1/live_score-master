import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/usecase/usecase.dart';
import 'package:live_score/src/features/soccer/domain/entities/standings.dart';
import 'package:live_score/src/features/soccer/domain/repositories/soccer_repository.dart';

class StandingsUseCase extends UseCase<Standings, StandingsParams> {
  final SoccerRepository soccerRepository;

  StandingsUseCase({required this.soccerRepository});

  @override
  Future<Either<Failure, Standings>> call(StandingsParams params) async {
    return await soccerRepository.getStandings(params: params);
  }
}

class StandingsParams extends Equatable {
  final int leagueId;

  const StandingsParams({required this.leagueId});

  @override
  List<Object?> get props => [leagueId];

  Map<String, dynamic> toJson() => {
    'competitions': leagueId,
    'withSeasonsFilter': 'false',
  };
}
