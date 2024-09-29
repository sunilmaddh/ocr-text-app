import 'package:flutter/material.dart';
class DataCard extends StatelessWidget {
  final String name;
  final String email;
  final String mobileNumber;

  const DataCard({
    Key? key,
    required this.name,
    required this.email,
    required this.mobileNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30,),
                 Flexible(
                   child: Text(
                    mobileNumber,
                    style: TextStyle(fontSize: 16),
                                   ),
                 ),
              ],
            ),
            SizedBox(height: 8),
              Text(
                  email,
                  style: TextStyle(fontSize: 16),
                ),
            
          ],
        ),
      ),
    );
  }
}
