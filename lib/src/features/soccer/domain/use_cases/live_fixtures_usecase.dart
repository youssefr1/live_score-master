import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/domain/entities/soccer_fixture.dart';
import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/usecase/usecase.dart';
import 'package:live_score/src/features/soccer/domain/repositories/soccer_repository.dart';

class TodayFixturesUseCase implements UseCase<List<SoccerFixture>, NoParams> {
  final SoccerRepository soccerRepository;

  TodayFixturesUseCase({required this.soccerRepository});

  @override
  Future<Either<Failure, List<SoccerFixture>>> call(NoParams params) async {
    return await soccerRepository.getTodayFixtures();
  }
}
