import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rootally_ai_flutter_assignment/view/homeComponents/greetingWidget.dart';
import 'package:rootally_ai_flutter_assignment/view/homeComponents/progressCard.dart';
import 'package:rootally_ai_flutter_assignment/view_model/home_controller.dart';
import 'package:timelines/timelines.dart';
import 'homeComponents/dailyTimeline.dart';

class homeWidget extends StatefulWidget {
  @override
  State<homeWidget> createState() => _homeWidgetState();
}

class _homeWidgetState extends State<homeWidget> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    //final ref = referenceDB.reference();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Rootally AI')
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          homeController.startSession("Session ${homeController.completed + 1}");
        },
        icon: Icon(Icons.play_arrow_rounded),
        label: Text("Start Session"),
      ),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                greetingWidget(),
                progressCard(controller: homeController),
                dailyTimeline(controller: homeController),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Open Dialog',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
            // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              showModal(context);
              break;
          }
          setState(
                () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
