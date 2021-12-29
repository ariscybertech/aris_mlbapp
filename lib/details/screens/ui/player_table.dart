import 'package:flutter/material.dart';
import 'package:simple_bet/shared/utils/constants.dart';

class PlayerTable extends StatelessWidget {
  const PlayerTable({
    Key key,
    this.title = SimpleBetConstants.kHittingIndex,
  }) : super(key: key);

  final List<String> title;

  @override
  Widget build(BuildContext context) {
    //

    return Table(
      columnWidths: {
        0: const FlexColumnWidth(2.0),
      },
      children: [
        _buildTableRow(title, showBgColor: true),
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
