import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:marx/models/Song.dart';

class NowPlaying extends StatefulWidget {
  final Song _currentSong;

  NowPlaying(this._currentSong);

  @override
  NowPlayingState createState() => NowPlayingState();
}

class NowPlayingState extends State<NowPlaying> {

  @override
  Widget build(BuildContext context) {
    final double _radius = 25.0;
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _albumArtSize = _screenHeight / 2.1;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: _albumArtSize + 50,
            child: Stack(
              children: <Widget>[
                AlbumArtContainer(
                      radius: _radius,
                      albumArtSize: _albumArtSize,
                      currentSong: widget._currentSong,
                    ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MusicBoardControls(),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
            height: _screenHeight / 15,
          ),
          PreferencesBoard(),
          Divider(
            color: Colors.transparent,
            height: _screenHeight / 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 12,
                  child: Container(
                    child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget._currentSong.albumName.toUpperCase() +
                                  " • " +
                                  widget._currentSong.artists.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFADB9CD),
                                letterSpacing: 1,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Divider(
                              height: 5,
                              color: Colors.transparent,
                            ),
                            Text(
                              widget._currentSong.title,
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFF4D6B9C),
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                  ),
                ),

              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
            height: _screenHeight / 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "0:00",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFADB9CD),
                        letterSpacing: 1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                NowPlayingSlider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumArtContainer extends StatelessWidget {
  const AlbumArtContainer({
    Key key,
    @required double radius,
    @required double albumArtSize,
    @required Song currentSong,
  })  : _radius = radius,
        _albumArtSize = albumArtSize,
        _currentSong = currentSong,
        super(key: key);

  final double _radius;
  final double _albumArtSize;
  final Song _currentSong;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: _albumArtSize,
            child: FadeInImage(
              placeholder: AssetImage(_currentSong.image),
              image: AssetImage(
                _currentSong.image,
              ),
              fit: BoxFit.fill,
            ),
          ),
          Opacity(
            opacity: 0.55,
            child: Container(
              width: double.infinity,
              height: _albumArtSize,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [
                    0.0,
                    0.85,
                  ],
                  colors: [
                    Color(0xFF47ACE1),
                    Color(0xFFDF5F9D),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PreferencesBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.favorite,
          size: 35,
          color: Color(0xFFC7D2E3),
        ),
        Icon(
          Icons.loop,
          size: 35,
          color: Color(0xFFC7D2E3),
        ),
        Icon(
          Icons.loop,
          size: 35,
          color: Color(0xFFC7D2E3),
        ),
      ],
    );
  }
}

class MusicBoardControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 245,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFDCE4F4),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: Offset(2, 1.5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.fast_rewind,
                        color: Color(0xFF7B92CA),
                        size: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Icon(
                        Icons.fast_forward,
                        color: Color(0xFF7B92CA),
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 30,
                            offset: Offset(2, 1.5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: AnimatedCrossFade(
                          crossFadeState: CrossFadeState.showFirst,
                          duration: Duration(milliseconds: 200),
                          firstChild: Icon(
                            Icons.pause,
                            size: 50,
                            color: Color(0xFF7B92CA),
                          ),
                          secondChild: Icon(
                            Icons.play_arrow,
                            size: 50,
                            color: Color(0xFF7B92CA),
                          ),
                        ),
                      ),
                    ),
                  ),

          ),
        ],
      ),
    );
  }
}


class NowPlayingSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Slider(
      value: 0.4,
      onChanged: (double value) => null,
      activeColor: Colors.blue,
      inactiveColor: Color(0xFFCEE3EE),
    );
  }
}