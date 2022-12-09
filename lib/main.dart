
import 'package:calculator/albums/album_list.dart';
import 'package:calculator/calculator/calculator_state.dart';
import 'package:calculator/calculator/history_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator/calculator.dart';

void main() {
  runApp(const CalculatorWidget());
}

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {

  int currentDestination = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorState>(
      create: (context) => CalculatorState(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) => {
              setState(() {
                currentDestination = index;
              })
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.calculate),
                label: 'Calculator',
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              NavigationDestination(
                icon: Icon(Icons.photo_album),
                label: 'Album',
              ),
            ],
          ),
          body: <Widget>[
            Calculator(),
            HistoryList(),
            AlbumList()
          ][currentDestination],
        ),
      ),
    );
  }
}










