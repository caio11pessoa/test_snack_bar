import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Demo'),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // this button will show a standart SnackBar that the Screen Reader identify
          ElevatedButton(
            onPressed: () {
              //Read Snackbar
              final snackBar = SnackBar(
                content: const Text('Standart snackbar'),
                action: SnackBarAction(
                  label: 'undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Show standart SnackBar'),
          ),
          // this button will show a getX SnackBar that the Screen Reader does not identify
          ElevatedButton(
            onPressed: () {
              //Unread SnackBar
              Get.snackbar(
                "SnackBar",
                "Inaccessible",
              );
            },
            child: const Text('Show inaccessible SnackBar'),
          ),
        ],
      ),
    );
  }
}
