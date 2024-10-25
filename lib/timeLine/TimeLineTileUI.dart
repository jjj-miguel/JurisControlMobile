import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:teste1/timeLine//EventPath.dart';

class TimeLineTileUI extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventChild;

  const TimeLineTileUI(
      {Key? key,
        required this.isFirst,
        required this.isLast,
        required this.isPast,
        required this.eventChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Color(0xFF053261) : Color(0xFF102F6C),),
        indicatorStyle: IndicatorStyle(
            width: 40.0,
            color: isPast ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF),
            iconStyle: IconStyle(
                iconData: Icons.circle,
                color: isPast ? Colors.blueAccent : Color(0xFFB0A695))),
        endChild: EventPath(
          isPast: isPast,
          childWidget: eventChild,
        ),
      ),
    );
  }
}