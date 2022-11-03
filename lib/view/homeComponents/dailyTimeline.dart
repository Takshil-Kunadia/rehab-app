
import 'package:flutter/material.dart';
import 'package:rootally_ai_flutter_assignment/view_model/home_controller.dart';
import 'package:timelines/timelines.dart';

import 'TTile.dart';

class dailyTimeline extends StatelessWidget {
  const dailyTimeline({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left:20,right:20,top:15,bottom: 20),
          child: FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0,
              color: Color(0xff989898),
              indicatorTheme: IndicatorThemeData(
                position: 0.5,
                size: 20.0,
              ),
              connectorTheme: ConnectorThemeData(
                thickness: 2.5,
              ),
            ),

            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemCount: controller.total_data,
              contentsBuilder: (BuildContext context, index) {
                return TTile();
              },
              indicatorBuilder: (BuildContext context, index) {
                if (true) {
                  return DotIndicator(
                    color: Color(0xff66c97f),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  );
                } else {
                  return OutlinedDotIndicator(
                    borderWidth: 2.5,
                  );
                }
              },
              connectorBuilder: (_, index, ___) => DashedLineConnector(
                color: Color(0xff66c97f) ,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
