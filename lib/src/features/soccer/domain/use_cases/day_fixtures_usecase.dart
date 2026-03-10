import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/domain/entities/soccer_fixture.dart';
import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/usecase/usecase.dart';
import 'package:live_score/src/features/soccer/domain/repositories/soccer_repository.dart';

class CurrentRoundFixturesUseCase implements UseCase<List<SoccerFixture>, int> {
  final SoccerRepository soccerRepository;

  CurrentRoundFixturesUseCase({required this.soccerRepository});

  @override
  Future<Either<Failure, List<SoccerFixture>>> call(int competitionId) async {
    return await soccerRepository.getCurrentRoundFixtures(
      competitionId: competitionId,
    );
  }
}
