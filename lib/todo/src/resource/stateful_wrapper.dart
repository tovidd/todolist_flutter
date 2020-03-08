import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const StatefulWrapper({@required this.onInit, @required this.child});

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    super.initState();
    if (this.widget.onInit != null) {
      if (SchedulerBinding.instance.schedulerPhase ==
          SchedulerPhase.persistentCallbacks) {
        SchedulerBinding.instance
            .addPostFrameCallback((_) => this.widget.onInit);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.child;
  }
}
