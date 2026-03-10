import 'package:live_score/src/features/soccer/data/models/standings_model.dart';
import 'package:live_score/src/features/soccer/data/models/team_rank_model.dart';
import 'package:live_score/src/features/soccer/domain/entities/standings.dart';
import 'package:live_score/src/features/soccer/domain/entities/team_rank.dart';

extension TeamRankExtension on TeamRankModel {
  TeamRank toDomain() => TeamRank(
    rank: rank,
    team: team,
    points: points,
    goalsDiff: goalsDiff,
    form: form,
    stats: stats,
    groupNum: groupNum,
  );
}

extension TeamRankStatsExtension on TeamRankStatsModel {
  TeamRankStats toDomain() => TeamRankStats(
    played: played,
    win: win,
    draw: draw,
    lose: lose,
    scored: scored,
    received: received,
  );
}

extension StandingsExtension on StandingsModel {
  Standings toDomain() => Standings(standings: standings);
}
