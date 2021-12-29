import 'package:flutter/material.dart';
import 'package:simple_bet/shared/utils/constants.dart';

class ScoreTable extends StatelessWidget {
  const ScoreTable({
    Key key,
    this.title = SimpleBetConstants.index,
    @required List<String> homeInnings,
    @required List<String> awayInnings,
  })  : _homeInnings = homeInnings,
        _awayInnings = awayInnings,
        super(key: key);

  final List<String> title;

  final List<String> _homeInnings;

  final List<String> _awayInnings;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: const FlexColumnWidth(2.0),
        10: const FlexColumnWidth(1.5),
        11: const FlexColumnWidth(1.5),
        12: const FlexColumnWidth(1.5),
      },
      children: [
        _buildTableRow(title, showBgColor: true),
        _buildTableRow(_homeInnings),
        _buildTableRow(_awayInnings),
      ],
    );
  }

  TableRow _buildTableRow(List<String> names, {bool showBgColor = false}) {
    //

    return TableRow(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
      ),
      children: [
        for (String i in names) ...[
          Container(
            color: showBgColor ? Colors.grey.withOpacity(0.09) : Colors.white54,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              i,
              style: TextStyle(fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ],
    );
  }
}
