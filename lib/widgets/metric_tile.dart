import 'package:flutter/material.dart';

class MetricTile extends StatelessWidget {
  final String? label;
  final String? unit;
  final num? value;

  const MetricTile({
    Key? key,
    this.label,
    this.unit,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value $unit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(label!),
        ],
      ),
    );
  }
}
