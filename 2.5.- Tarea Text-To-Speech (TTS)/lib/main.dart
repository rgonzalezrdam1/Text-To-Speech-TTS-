import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text To Speech',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'De texto a voz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VoiceController _voiceController;

  String text =
      'Aqui comprobamos que funciona bien.';

  @override
  void initState() {
    _voiceController = FlutterTextToSpeech.instance.voiceController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _voiceController.stop();
  }

  _playVoice() {
    _voiceController.init().then((_) {
      _voiceController.speak(
        text,
        VoiceControllerOptions(),
      );
    });
  }

  _stopVoice() {
    _voiceController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
              ) ,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: _playVoice,
              color: Colors.green[300],
              child: Text('Iniciar voz'),
            ),
            RaisedButton(
              onPressed: _stopVoice,
              color: Colors.red[300],
              child: Text('Detener voz'),
            ),
          ],
        ),
      ),
    );
  }
}