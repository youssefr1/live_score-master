import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/domain/entities/league.dart';
import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/usecase/usecase.dart';
import 'package:live_score/src/features/soccer/domain/repositories/soccer_repository.dart';

class LeaguesUseCase implements UseCase<List<League>, NoParams> {
  final SoccerRepository soccerRepository;

  LeaguesUseCase({required this.soccerRepository});

  @override
  Future<Either<Failure, List<League>>> call(NoParams params) async {
    return await soccerRepository.getLeagues();
  }
}
