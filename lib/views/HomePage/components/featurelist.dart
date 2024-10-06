import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/theme.dart';
import 'package:travel/views/HomePage/state/homepageStateProvider.dart';

class TopFeaturedList extends StatefulWidget {
  @override
  _TopFeaturedListState createState() => _TopFeaturedListState();
}

class _TopFeaturedListState extends State<TopFeaturedList> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<HomePageStateProvider>(
      builder: (context, state, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          height: 60,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Evenly spaced buttons
            children: List.generate(state.kTopListLink.length, (index) {
              return TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    state.kTopListLink[index],
                    style: kAppTheme.textTheme.headlineMedium?.merge(
                      TextStyle(
                        fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                        color: index == 0 ? kAppTheme.colorScheme.secondary : null,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
