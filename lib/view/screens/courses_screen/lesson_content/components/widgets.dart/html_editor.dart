import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class MyHtmlEditor extends StatefulWidget {
  const MyHtmlEditor({super.key});

  @override
  _MyHtmlEditorState createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: controller, //required
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
