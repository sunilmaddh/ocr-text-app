import 'package:flutter/material.dart';
class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTop, required this.btName});
  final VoidCallback onTop;
  final String btName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTop, child: Text(btName));
  }
}