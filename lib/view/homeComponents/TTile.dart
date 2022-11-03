
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TTile extends StatelessWidget {
  const TTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Session 1"),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text("9:41 AM")
                    ],
                  ),
                  Image.asset('assets/images/Asset 7@2x.png',
                    height: 80,
                    width: 80,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
