import 'package:dartz/dartz.dart';

import 'package:live_score/src/core/error/error_handler.dart';
import 'package:live_score/src/core/usecase/usecase.dart';
import 'package:live_score/src/features/fixture/domain/entities/fixture_details.dart';
import 'package:live_score/src/features/fixture/domain/repositories/fixture_repository.dart';

class FixtureDetailsUseCase implements UseCase<FixtureDetails, int> {
  final FixtureRepository fixtureRepository;

  FixtureDetailsUseCase({required this.fixtureRepository});

  @override
  Future<Either<Failure, FixtureDetails>> call(int params) async {
    return await fixtureRepository.getFixtureDetails(params);
  }
}
