import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceSearchWidget extends StatefulWidget {
  final Function(String) onQueryChanged;

  const VoiceSearchWidget({Key? key, required this.onQueryChanged}) : super(key: key);

  @override
  _VoiceSearchWidgetState createState() => _VoiceSearchWidgetState();
}

class _VoiceSearchWidgetState extends State<VoiceSearchWidget> {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _isListening = true;
      });
      _speech.listen(onResult: (result) {
        String recognizedWords = result.recognizedWords.trim();
        if (recognizedWords.endsWith('.')) {
          recognizedWords = recognizedWords.substring(0, recognizedWords.length - 1);
        }
        widget.onQueryChanged(recognizedWords);
      });
    }
  }


  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
      onPressed: () {
        if (_isListening) {
          _stopListening();
        } else {
          _startListening();
        }
      },
    );
  }
}
