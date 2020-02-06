import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:marx/models/Song.dart';
import 'package:marx/screens/now_playing.dart';
import 'package:marx/widgets/songCard.dart';
import 'package:marx/screens/song_play.dart';

class Music extends StatefulWidget {

  @override
  MusicState createState() => MusicState();
}

class MusicState extends State<Music> {
  List<Song> songsList = [
    Song(title: 'More than you Know', albumName: 'AlbumE', length: '03:42:22', image: 'assets/image1.jpg'),
    Song(title: 'SOS', albumName: 'AlbumD', length: '04:33:23', image: 'assets/image2.jpg'),
    Song(title: 'Birds', albumName: 'AlbumF', length: '03:30:00', image: 'assets/image3.jpg'),
    Song(title: 'Lily', albumName: 'AlbumG', length: '04:22:39', image: 'assets/image4.jpg'),
    Song(title: 'Alone', albumName: 'AlbumZ', length: '02:43:33', image: 'assets/image5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                "assets/gradient_background.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 52),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.all(2),
                    crossAxisCount: 2,
                    children: List.generate(songsList.length, (index) {
                      return Center(
                        child: SongCard(
                          image: songsList[index].image,
                          title: songsList[index].title,
                          length: songsList[index].length,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                NowPlaying(songsList[index]))
                            );
                          },
                        ),
                      );
                    }),
                 ),
                ),
              ]
            ),
          ]
      ),
    );
  }
}