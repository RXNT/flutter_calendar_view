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
      timeStringBuilder:(date ,{secondaryDate})=> (date.hour == 9 && date.minute == 0 )? "" : DateFormat('KK:mm').format(date),
      width: width,
      heightPerMinute:1.4,
      timeLineWidth: 60,
      lineInterval: 30,
      titleInterval: 30,
      startIntervalTime: 9,
      endIntervalTime:  22,
    );
  }
}
