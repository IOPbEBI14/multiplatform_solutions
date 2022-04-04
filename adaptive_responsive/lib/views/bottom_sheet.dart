import 'package:flutter/material.dart';

Widget toggleBottomSheet(BuildContext context) {
  //if (_bsController==null){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        title: const Text('View Profile'),
        leading: const Icon(Icons.person),
        onTap: () => Navigator.of(context).pop(),
      ),
      ListTile(
        title: const Text('Friends'),
        leading: const Icon(Icons.people),
        onTap: () => Navigator.of(context).pop(),
      ),
      ListTile(
        title: const Text('Report'),
        leading: const Icon(Icons.analytics),
        onTap: () => Navigator.of(context).pop(),
      ),
    ],
  );
}
