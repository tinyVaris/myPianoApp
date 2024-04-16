import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'PianoKeysWidgets.dart';
import 'MyPianoSettings.dart';



class PianoApp extends StatelessWidget {
  const PianoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPiano',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade100),
        useMaterial3: true,
      ),
      home: const MainPianoScreen(title: 'MyPiano'),
    );
  }
}


class MainPianoScreen extends StatefulWidget {
  const MainPianoScreen({super.key, required this.title});
  final String title;

  @override
  State<MainPianoScreen> createState() => _MainPianoScreenState();
}


//Create a variable to play MP3 files from the Assets Folder
var assetAudioPlayer = AssetsAudioPlayer();
final FocusNode _focusNode = FocusNode();

//This private function uses the variable assetAudioPlayer to play music notes
void readMusicTone(String tone) {
  assetAudioPlayer.open(Audio("assets/notes/$tone.mp3"));
}


class _MainPianoScreenState extends State<MainPianoScreen> {
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.bottom]);


    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: Colors.deepPurple.shade100,
      //   actions: [
      //     //Pressing this settings button in the top right hand corner sends the user to settings
      //     IconButton(onPressed: () => {
      //       Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const SettingsScreen(title: 'Settings')),
      //       )
      //     }, icon: const Icon(Icons.settings)),
      //   ],
      // ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double whiteKeysWidth = constraints.maxWidth / 7;
            return RawKeyboardListener(
                focusNode: _focusNode,
                autofocus: true,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //Create all tiles for piano for each hey
                    //Tiles: tone, position, width, height
                    whiteTile('C', 0, whiteKeysWidth),
                    whiteTile('D', 1, whiteKeysWidth),
                    whiteTile('E', 2, whiteKeysWidth),
                    whiteTile('F', 3, whiteKeysWidth),
                    whiteTile('G', 4, whiteKeysWidth),
                    whiteTile('A', 5, whiteKeysWidth),
                    whiteTile('B', 6, whiteKeysWidth),
                    //Make all black tiles of the piano have half of the height of the white tiles
                    blackTile('Db', 1, whiteKeysWidth, constraints.maxHeight / 2),
                    blackTile('Eb', 2, whiteKeysWidth, constraints.maxHeight / 2),
                    blackTile('Gb', 4, whiteKeysWidth, constraints.maxHeight / 2),
                    blackTile('Ab', 5, whiteKeysWidth, constraints.maxHeight / 2),
                    blackTile('Bb', 6, whiteKeysWidth, constraints.maxHeight / 2),
                  ],
                )
            );
          },
        ),
      ),
    );
  }


}