import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../model/event.dart';

final List<String> weekTitles = ["M", "T", "W", "T", "F", "S", "S"];

class WeekViewWidget extends StatelessWidget {
  final GlobalKey<WeekViewState>? state;
  final double? width;

  const WeekViewWidget({Key? key, this.state, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeekView<Event>(
      key: state,
      width: width,
        lineInterval: 30,
        heightPerMinute:1.4,
        titleInterval: 30,
        timeLineWidth: 60,
        startIntervalTime: 9,
        endIntervalTime: 22,
        // timeLineStringBuilder:(date ,{secondaryDate})=> (date.hour == 9 && date.minute == 0 )? "" : DateFormat('KK:mm').format(date),
      weekDayBuilder: (date) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weekTitles[date.weekday - 1], style: TextStyle(color: Colors.red),),
            Text(date.day.toString()),
          ],
        ),
      ),
      timeLineBuilder: (date) {
        final timeLineString = (date.hour == 9 && date.minute == 0 )? "" : DateFormat('KK:mm').format(date);
        return Transform.translate(
          offset: Offset(0, -7.5),
          child: Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: Text(
              timeLineString,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blue
              ),
            ),
          ),
        );
      },
      eventTileBuilder: (date ,events,__,___,____)=> Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (events.isNotEmpty && events[0].title.isNotEmpty)
              Text(
                events[0].title,
                style:
                    TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
          ],
        ),
      ),
    );
  }
}
