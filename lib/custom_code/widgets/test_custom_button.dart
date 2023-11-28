// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!

class TestCustomButton extends StatefulWidget {
  const TestCustomButton({
    Key? key,
    this.width,
    this.height,
    this.shadow = false,
    this.buttonLabel = 'button',
    this.buttonIcon = Icons.settings,
    this.iconBgColor = Colors.deepPurple,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool shadow;
  final String buttonLabel;
  final IconData buttonIcon;
  final Color iconBgColor;
  final Color iconColor;

  @override
  _TestCustomButtonState createState() => _TestCustomButtonState();
}

class _TestCustomButtonState extends State<TestCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: widget.shadow ? Colors.grey : Colors.transparent,
            offset: Offset(1.0, 2.0),
            blurRadius: 8.0,
            spreadRadius: 2.0,
          )
        ],
      ),
      child: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Row(
              children: <Widget>[
                Container(
                  width: 48.0,
                  height: 48.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: widget.iconBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(widget.buttonIcon, color: widget.iconColor),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(widget.buttonLabel),
                  ),
                ),
              ],
            ),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
