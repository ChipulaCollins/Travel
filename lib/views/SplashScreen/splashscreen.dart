import 'package:flutter/material.dart';
import 'package:travel/constants/colors.dart';
import 'package:travel/routes/routes.dart';
import 'package:travel/theme.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData appTheme = Theme.of(context);

    // Define ElevatedButton style
    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: appTheme.colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 18,
        fontFamily: 'PlayFair',
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Container(
            height: size.height * 0.55,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              child: const Image(
                image: AssetImage('assets/image/AppIcons/image_fx_15.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Padding(
           // padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.9), // Customize vertical and horizontal padding

         // ),
          Container(
            height: size.height * 0.45,
            padding: const EdgeInsets.all(42),
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Welcome To HelpMeHero",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,

                    style: appTheme.textTheme.displayLarge,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Your Satisfaction is Our Mission. Streamline your IT operations and minimize downtime with our user-friendly app.",
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                  style: appTheme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 18, width: 17,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.ROUTE_Home);
                  },
                  style: elevatedButtonStyle,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Begin"),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}