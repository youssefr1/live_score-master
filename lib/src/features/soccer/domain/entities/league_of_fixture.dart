import 'package:equatable/equatable.dart';

import 'package:live_score/src/core/domain/entities/league.dart';
import 'package:live_score/src/core/domain/entities/soccer_fixture.dart';

class LeagueOfFixture extends Equatable {
  final List<SoccerFixture> fixtures = [];
  final League league;

  LeagueOfFixture({required this.league});

  @override
  List<Object?> get props => [league, fixtures];
}
