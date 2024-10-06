import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel/components/rating,.dart';
import 'package:travel/models/placesModel.dart';
import 'package:travel/theme.dart';



class FeaturedCard extends StatefulWidget {
  final PlaceModel placeModel;

  const FeaturedCard({Key? key, required this.placeModel}) : super(key: key);

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData appTheme = Theme.of(context);

    return Container(
      width: size.width * 0.85,
      height: max(200, size.height * 0.32),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.withAlpha(90),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image(
              image: AssetImage(widget.placeModel.imgUrl),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 8, top: 8),
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black.withAlpha(95),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.placeModel.placeTitle,
                          style: kAppTheme.textTheme.displaySmall,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: kAppTheme.primaryColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}