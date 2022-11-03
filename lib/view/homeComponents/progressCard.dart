import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rootally_ai_flutter_assignment/view_model/home_controller.dart';

class progressCard extends StatelessWidget {
  const progressCard({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 30,
      shadowColor: Colors.black,
      child: SizedBox(
        width: 350,
        height: 150,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Progress"),
                    Text("${controller.percentage}%"),
                  ],
                ),
                SizedBox(height: 10,),
                LinearProgressIndicator(
                  value: controller.percentage.toDouble(),
                  semanticsLabel: 'Linear progress indicator',
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Icon(
                            Icons.done_outline_outlined
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Completed"),
                            SizedBox(height: 5,),
                            Text("${controller.completed} Sessions"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 20,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Icon(
                            Icons.arrow_circle_right_outlined
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Remaining"),
                            SizedBox(height: 5,),
                            Text("${controller.pending} Sessions"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
