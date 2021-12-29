import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_bet/details/screens/ui/player_table.dart';

import 'package:simple_bet/shared/models/batters_pitchers_notifier.dart';
import 'package:simple_bet/shared/models/player_stats_notifier.dart';
import 'package:simple_bet/shared/utils/constants.dart';

class StatsSection extends StatelessWidget {
  /// Stats Section for the team...
  const StatsSection({Key key, this.showHome = true}) : super(key: key);

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    //

    return Consumer<BattersPitchersNotifier>(
      builder: (context, model, _) {
        //
        final _model = model.battersPitchers;

        if (_model == null) return CircularProgressIndicator();

        final _teams = _model.liveData.boxscore.teams;
        final _batters = _teams.home.batters;
        final _pitchers = _teams.home.pitchers;

        if (!showHome) {
          final _batters = _teams.away.batters;
          final _pitchers = _teams.away.pitchers;

          return ChangeNotifierProvider<PlayerStatsNotifier>(
            create: (_) => PlayerStatsNotifier()..callApi(_batters.first),
            child: _InternalWidget(),
          );
        }

        return ChangeNotifierProvider<PlayerStatsNotifier>(
          create: (_) => PlayerStatsNotifier()..callApi(_batters.first),
          child: _InternalWidget(),
        );
      },
    );
  }
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Consumer<PlayerStatsNotifier>(
      builder: (context, model, _) {
        //
        final _model = model.playerStats;

        if (_model == null) return CircularProgressIndicator();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  SimpleBetConstants.kHittingSection,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            PlayerTable(
              title: SimpleBetConstants.kHittingIndex,
            ),
            //

            const SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  SimpleBetConstants.kPitchingSection,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            PlayerTable(
              title: SimpleBetConstants.kPitchingIndex,
            ),
          ],
        );
      },
    );
  }
}
