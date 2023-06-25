import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Xylophone is Here!',
                  style: TextStyle(
                fontSize: 30.0,
            ),
            ),
          ),
        ),
        body: AppBody(),
      ),
    );
  }
}


class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  void playSound(int soundNumber){
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/note$soundNumber.wav"),
    );
  }

  Expanded soundKey({required Color color, required int soundNumberr }){
    return Expanded(
      child: TextButton(
        onPressed: (){
          playSound(soundNumberr);
        },
        child: Container(
          height: 100.0,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        soundKey(color: Colors.red, soundNumberr: 1),
        soundKey(color: Colors.yellowAccent, soundNumberr: 5),
        soundKey(color: Colors.purpleAccent, soundNumberr: 3),
        soundKey(color: Colors.orange, soundNumberr: 2),
        soundKey(color: Colors.greenAccent, soundNumberr: 4),
      ],
    );
  }
}




