import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Song {
  String title;
  var image;
  String comments;
  String artists;
  String albumName;
  String length;
  String genre;

  Song({@required this.title, this.image, this.comments, this.artists,
    @required this.albumName, @required this.length, this.genre}) {
    title = this.title;
    albumName = this.albumName;
    length = this.length;
    image = this.image ?? "assets/music_icon.png";
    comments = this.comments ?? "Test commnents";
    artists = this.artists ?? 'ArtistF';
    genre = this.genre ?? "Test genre";
  }
}