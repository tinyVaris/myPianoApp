import 'package:flutter/material.dart';
import 'PianoScreen.dart';


//Create the white keys of the piano
Widget whiteTile(String tone, double position, double whiteWidth) {
  return Positioned(
      top: 0,
      left: position * whiteWidth,
      width: whiteWidth,
      bottom: 0,
      child: RawMaterialButton(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        //Whenever user taps key, read the music tone for corresponding key
        onPressed: () => readMusicTone(tone),
      )
  );
}


//Create the black keys of the piano
Widget blackTile(String tone, double position, double whiteWidth, double height) {
    double blackTileWidth = whiteWidth * 0.60;
    return Positioned(
        top: 0,
        left: position * whiteWidth - blackTileWidth / 2,
        width: blackTileWidth,
        height: height,
        child: RawMaterialButton(
          fillColor: Colors.deepPurple.shade300,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          //Whenever user taps key, read the music tone for corresponding key
          onPressed: () => readMusicTone(tone),
        ),
    );
}