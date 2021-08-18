import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/src/text_background_status.dart';

import 'package:text_editor/src/text_style_model.dart';

class TextBackgroundColor extends StatefulWidget {
  final Widget? enable;
  final Widget? exchange;
  final Widget? disable;

  TextBackgroundColor({this.enable, this.exchange, this.disable});

  Widget _mapTextBackgroundColorToWidget() {
    switch (TextBackgroundStatus.status) {
      case TextBackgroundColorStatus.none:
        return disable ??
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: null,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Icon(
                Icons.format_bold,
                size: 20,
                color: Colors.white,
              ),
            );
      case TextBackgroundColorStatus.enable:
        return enable ??
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Icon(
                Icons.format_bold,
                size: 20,
                color: Colors.black,
              ),
            );
      case TextBackgroundColorStatus.exchange:
        return exchange ??
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Icon(
                Icons.format_bold,
                size: 20,
                color: Colors.black,
              ),
            );
    }
  }

  @override
  _TextBackgroundColorState createState() => _TextBackgroundColorState();
}

class _TextBackgroundColorState extends State<TextBackgroundColor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            TextStyleModel textStyleModel =
                Provider.of<TextStyleModel>(context, listen: false);
            switch (TextBackgroundStatus.status) {
              case TextBackgroundColorStatus.none:
                TextBackgroundStatus.status = TextBackgroundColorStatus.enable;
                break;
              case TextBackgroundColorStatus.enable:
                TextBackgroundStatus.status =
                    TextBackgroundColorStatus.exchange;
                break;
              default:
                TextBackgroundStatus.status = TextBackgroundColorStatus.none;
            }
            textStyleModel.editTextBackgroundColor();
          });
        },
        child: widget._mapTextBackgroundColorToWidget());
  }
}
