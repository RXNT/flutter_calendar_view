import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';
import 'package:intl/intl.dart';
class DayViewWidget extends StatelessWidget {
  final GlobalKey<DayViewState>? state;
  final double? width;

  const DayViewWidget({
    Key? key,
    this.state,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DayView<Event>(
      key: state,
      dateStringBuilder:(date ,{secondaryDate})=> DateFormat('EEE \n dd').format(date),
      dayTitleBuilder: (date) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateFormat('EEE').format(date), style: TextStyle(color: Colors.red),),
            Text(DateFormat('dd').format(date)),
          ],
        ),
      ),
      // timeStringBuilder:(date ,{secondaryDate})=> (date.hour == 9 && date.minute == 0 )? "" : DateFormat('KK:mm').format(date),
      width: width,
      heightPerMinute:1.4,
      timeLineWidth: 55,
      lineInterval: 30,
      titleInterval: 30,
      startIntervalTime: 9,
      endIntervalTime:  22,
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
                  fontSize: 12.0,
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
