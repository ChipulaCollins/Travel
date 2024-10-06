import 'package:flutter/material.dart';

class ImageSource {
  final String? assetPath;
  final Image? imageWidget;

  ImageSource({this.assetPath, this.imageWidget});
}
class PlaceModel {
  String placeTitle;
  String locationShort;
  String description;
  int duration;
  double rateperpackage;
  ImageProvider imgProvider;
  dynamic imgUrl; // Use dynamic to accept String or Image

  PlaceModel({
    required this.placeTitle,
    required this.description,
    required this.duration,
    required this.imgUrl,
    required this.locationShort,
    required this.rateperpackage,
    required this.imgProvider,
  });
}