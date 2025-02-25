import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


class Translator extends StatefulWidget {
  @override
  _TranslatorState createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  final translator = GoogleTranslator();
  bool isTamil = false;
  String title = "Translator App";
  String paragraph = "This is a simple paragraph demonstrating translation.";

  void translateText() async {
    if (isTamil) {
      setState(() {
        title = "Translator App";
        paragraph = "This is a simple paragraph demonstrating translation.";
      });
    } else {
      var translatedTitle = await translator.translate(title, to: 'ta');
      var translatedParagraph = await translator.translate(paragraph, to: 'ta');
      setState(() {
        title = translatedTitle.text;
        paragraph = translatedParagraph.text;
      });
    }
    isTamil = !isTamil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              paragraph,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: translateText,
        child: Icon(Icons.translate),
      ),
    );
  }
}
