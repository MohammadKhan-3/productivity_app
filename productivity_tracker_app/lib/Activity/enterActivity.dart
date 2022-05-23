import 'package:flutter/material.dart';
import 'package:productivity_tracker_app/main.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        // appBar: AppBar(
        // title: const Text('Enter Activity'),
        // ),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            // FloatingActionButton(
            //   child: const Icon(Icons.edit),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => MyHomePage()));
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // ),
    );
  }
}
