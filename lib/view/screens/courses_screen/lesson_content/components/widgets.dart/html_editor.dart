import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class MyHtmlEditor extends StatefulWidget {
  final HtmlEditorController controller;
  const MyHtmlEditor({super.key, required this.controller});

  @override
  State<MyHtmlEditor> createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  //  = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: widget.controller, //required
      htmlEditorOptions: const HtmlEditorOptions(
        hint: "Your text here...",
        //initialText: "<p>text content initial, if any</p>",
      ),
      htmlToolbarOptions: const HtmlToolbarOptions(
        defaultToolbarButtons: [
          StyleButtons(),
          FontSettingButtons(fontSizeUnit: false),
          InsertButtons(),
          FontButtons(),
          ColorButtons(),
          ListButtons(),
          ParagraphButtons(),
          OtherButtons(),
        ],
      ),
      otherOptions: const OtherOptions(
        height: 400,
      ),
    );
  }
}
