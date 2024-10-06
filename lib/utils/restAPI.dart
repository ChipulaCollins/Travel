import 'package:flutter/material.dart';
import 'package:travel/models/placesModel.dart';

class RESTAPI {
  List<PlaceModel> dummyFeatured = [
    PlaceModel(
        placeTitle: "Remote Assistance",
        description: "Get real-time assistance from our technicians.",
        duration: 5,
        imgProvider: const AssetImage('assets/image/AppIcons/image_fx_15.jpg'), // Use AssetImage here
        locationShort: "Honshu, Japan",
        rateperpackage: 400.0,
        imgUrl: 'assets/image/image_fx_5.jpg',),
    PlaceModel(
        placeTitle: "Analytics",
        description:
            "Keep inventory of devices, software, and hardware",
        duration: 6,
        imgProvider: const AssetImage('assets/image/AppIcons/image_fx_15.jpg'),
        locationShort: "Ladakh, India",
        rateperpackage: 350.0,
         imgUrl: 'assets/image/image_fx_6.jpg',),
    PlaceModel(
        placeTitle: "Chat Support",
        description:
            "Get quick and personalized assistance for your IT needs.",
        duration: 7,
        imgProvider: const AssetImage('assets/image/AppIcons/image_fx_1.jpg'),
        locationShort: "Honshu, Japan",
        rateperpackage: 250.0,
        imgUrl: 'assets/image/image_fx_1.jpg',),
    PlaceModel(
        placeTitle: "Report Sharing",
        description:
            "Learn best practices and tips for optimizing your IT systems.",
        duration: 5,
      imgProvider: const AssetImage('assets/image/image_fx_7.jpg'),
        locationShort: "Honshu, Japan",
        rateperpackage: 300.0,
        imgUrl: 'assets/image/image_fx_7.jpg',)
  ];

  List<PlaceModel> dummyAllPlaces = [
    PlaceModel(
        placeTitle: "Ticket Management",
        description:
            "Submit and track support tickets effortlessly",
        duration: 5,
        imgProvider: const AssetImage('assets/image/edit.png'),
        locationShort: "Honshu, Japan",
        rateperpackage: 400.0,
        imgUrl: 'assets/image/image_fx_2.jpg'),
    PlaceModel(
        placeTitle: "Knowledge Base",
        description:
            "Search for articles, FAQs, and troubleshooting guides.",
        duration: 6,
      imgProvider: const AssetImage('assets/image/image_fx_7.jpg'),
        locationShort: "Ladakh, India",
        rateperpackage: 350.0,
        imgUrl: 'assets/image/image_fx_5.jpg',),
    PlaceModel(
        placeTitle: "Reporting and Analytics",
        description:
            "Gain insights into your IT support performance.",
        duration: 7,
      imgProvider: const AssetImage('assets/image/AppIcons/image_fx_15.jpg'),
        locationShort: "Honshu, Japan",
        rateperpackage: 250.0,
        imgUrl: 'assets/image/image_fx_9.jpg',),
    PlaceModel(
        placeTitle: "Device Tracking",
        description:
            "Track and manage your IT assets with ease.",
        duration: 5,
      imgProvider: const AssetImage('assets/image/AppIcons/image_fx_15.jpg'),
        locationShort: "Honshu, Japan",
        rateperpackage: 300.0,
        imgUrl: 'assets/image/image_fx_4.jpg',),
    PlaceModel(
        placeTitle: "Chat Support",
        description:
            "Connect with our support team instantly via chat",
        duration: 5,
      imgProvider: const AssetImage('assets/image/AppIcons/image_fx_15.jpg'),
        locationShort: "Honshu, Japan",
        rateperpackage: 400.0,
        imgUrl: 'assets/image/image_fx_.png',),
    PlaceModel(
        placeTitle: "Asset Management",
        description:
            "Ensure efficient asset management and procurement.",
        duration: 6,
      imgProvider: const AssetImage('assets/image/AppIcons/image_fx_15.jpg'),
        locationShort: "Ladakh, India",
        rateperpackage: 350.0,
        imgUrl: 'assets/image/image_fx_8.jpg',),

  ];

  Future<List<PlaceModel>> getFeaturedPlaces() async {
    await Future.delayed(Duration(milliseconds: 750));
    return dummyFeatured;
  }

  Future<List<PlaceModel>> getAllPlaces() async {
    await Future.delayed(Duration(milliseconds: 950));
    return dummyAllPlaces;
  }
}
