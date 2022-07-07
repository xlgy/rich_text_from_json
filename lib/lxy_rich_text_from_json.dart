library lxy_rich_text_from_json;

import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

class RichTextView extends StatefulWidget {
  String rich_text_config;

  RichTextView(this.rich_text_config);

  @override
  State<RichTextView> createState() => _RichTextViewState();
}

class _RichTextViewState extends State<RichTextView> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: _textSpanList(),
    ));
  }

  List<TextSpan> _textSpanList(){
    List<TextSpan> spanList = [];
    var jsonMap = json.decode(widget.rich_text_config);
    String message = jsonMap['message'];
    int defaultTextSize = jsonMap['textSize'];
    String defaultTextColorStr = jsonMap['textColor'];
    Color defaultTextColor = Color(int.parse('0xff' + defaultTextColorStr));
    List richTexts = jsonMap['richTexts']??[];
    if(richTexts.isEmpty){
      TextSpan defaultTextSpan = TextSpan(text: message,
        style: TextStyle(color:defaultTextColor, fontSize: defaultTextSize.toDouble()),
      );
      return [defaultTextSpan];
    }

    int currentIndex = 0;
    for(Map richText in richTexts){
      int startIndex = richText['startIndex'];

      if(currentIndex != startIndex){
        spanList.add(
            TextSpan(text: message.substring(currentIndex,startIndex),
              style: TextStyle(color:defaultTextColor, fontSize: defaultTextSize.toDouble()),
            )
        );
      }

      int endIndex = richText['endIndex'];
      currentIndex = endIndex;

      String childText = message.substring(startIndex,endIndex);
      int childTextSize = richText['textSize'];
      double textSize = richText['textSize'] == null?defaultTextSize.toDouble():childTextSize.toDouble();
      String textColorStr = richText['textColor']??defaultTextColorStr;
      Color textColor = Color(int.parse('0xff' + textColorStr));

      spanList.add(
          TextSpan(text: childText,
            style: TextStyle(color:textColor, fontSize: textSize),
          )
      );
    }

    if(currentIndex != message.length - 1){
      spanList.add(
          TextSpan(text: message.substring(currentIndex,message.length),
            style: TextStyle(color:defaultTextColor, fontSize: defaultTextSize.toDouble()),
          )
      );
    }
    return spanList;
  }
}

