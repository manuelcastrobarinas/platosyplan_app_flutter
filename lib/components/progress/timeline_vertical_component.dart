import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

enum _TimelineVerticalStatus {
  done,
  todo,
}

class TimelineVerticalComponent extends StatelessWidget {
  final double heightToSpaceToNodes;
  final List<bool> stepsStatus;
  
  const TimelineVerticalComponent({
    super.key,
    required this.stepsStatus,
    required this.heightToSpaceToNodes
  });

  @override
  Widget build(BuildContext context) {
    final List<_TimelineVerticalStatus> data = stepsStatus.map((isDone) => isDone ? _TimelineVerticalStatus.done : _TimelineVerticalStatus.todo).toList();

    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        connectorTheme: const ConnectorThemeData(
          thickness: 4.0,
          color: Color(0xffd3d3d3),
        ),
        indicatorTheme: const IndicatorThemeData(size: 40.0),
      ),
      builder: TimelineTileBuilder.connected(
        connectorBuilder: (_, index, __) {
          if (index < data.length - 1 && data[index + 1] == _TimelineVerticalStatus.done) return SolidLineConnector(color: Theme.of(context).primaryColor);
          return const SolidLineConnector();
        },
        indicatorBuilder: (_, index) {
          switch (data[index]) {
            case _TimelineVerticalStatus.done:
              return  OutlinedDotIndicator(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(3.0), 
                  child:  DotIndicator(
                    color: Theme.of(context).primaryColor,
                    child:  Center(
                      child: Text((index+1).toString(), style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w900)),
                    ),
                  )
                ),
              );
            
            case _TimelineVerticalStatus.todo:
            default:
              return OutlinedDotIndicator(
                size: 25,
                color: Colors.grey,
                backgroundColor: Colors.grey,
                child: Center(child: Text((index+1).toString(), style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w900))),
              );
          }
        },
        itemExtentBuilder: (_, __) => 100.0,
        itemCount: stepsStatus.length,
      ),
    );
  }
}