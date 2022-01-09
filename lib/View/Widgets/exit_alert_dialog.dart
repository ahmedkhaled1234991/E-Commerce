import 'dart:io';

import 'package:flutter/material.dart';

class ExitAlertDialog {

    Future<bool> onBackPressed(BuildContext context) async{
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[300],
              title: const Text("Confirm", style: TextStyle(color: Colors.black),),
              content: const Text("Do you want to exit the App?", style: TextStyle(color: Colors.black),),
              actions: [
                TextButton(
                  child: const Text("No", style: TextStyle(color: Colors.black),),
                  onPressed: () async {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text("Yes", style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    exit(0);
                  },
                ),
              ],
          );
        },
        ) ??
    false;
  }
}
