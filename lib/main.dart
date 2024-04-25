import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(const PlayAudio());
}

class PlayAudio extends StatelessWidget {
  const PlayAudio({super.key});

  Expanded myButton(String audioSource, String audioText, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          onPressed: () {
            final player = AudioPlayer();
            player.play(
              AssetSource(audioSource),
              // Don't add "assets/" to the path, unlike "AssetImage"
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.play_arrow,
                  color: textColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  audioText,
                  style: TextStyle(color: textColor, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ringtones',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[500],
          //By default, Colors.color=Colors.color[500]
          title: const Text(
            'نغمات',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            myButton('ربنا يا ولي النعم.mp3', 'ربنا يا ولي النعم', Colors.red),
            myButton('أين الخلل.mp3', 'أين الخلل', Colors.orange),
            myButton('تلبس الأخلاق.mp3', 'تلبس الأخلاق', Colors.yellow),
            myButton('قلبي سجد_1.mp3', 'قلبي سجد_1', Colors.green),
            myButton('Open Your Eyes.mp3', 'Open Your Eyes', Colors.blue),
            myButton('The Lion Sleeps Tonight.mp3', 'The Lion Sleeps Tonight',
                Colors.indigo),
            myButton('Liquid Dance.mp3', 'Liquid Dance', Colors.purple),
          ],
        ),
      ),
    );
  }
}
