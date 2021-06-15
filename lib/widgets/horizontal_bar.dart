import 'package:flutter/material.dart';

class PokemonStatBar extends StatelessWidget {
  final String? label;
  final int? value;
  final int maxValue;
  final Color backgroundColor;
  final Color? foregroundColor;
  final double height;

  const PokemonStatBar({
    Key? key,
    this.label,
    this.value,
    this.maxValue = 300,
    this.backgroundColor = Colors.black12,
    this.foregroundColor,
    this.height = 22.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _buildLabel(),
          Expanded(
            child: Stack(
              children: [
                _buildBar(color: backgroundColor, value: maxValue),
                _buildBar(color: foregroundColor, value: value!),
                _buildBarText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel() {
    return Container(
      width: 75.0,
      child: Text(
        label!.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBar({Color? color, required int value}) {
    return FractionallySizedBox(
      widthFactor: value / maxValue,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height),
        ),
      ),
    );
  }

  Widget _buildBarText() {
    return Container(
      height: height,
      alignment: Alignment.center,
      child: Text(
        '$value / $maxValue',
        style: TextStyle(
          fontSize: height * 0.6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
