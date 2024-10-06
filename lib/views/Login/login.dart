import 'package:flutter/material.dart';
import 'package:travel/components/appbar.dart';
import 'package:travel/constants/colors.dart';
import 'package:travel/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/views/HomePage/homepage.dart';
import 'package:travel/views/Login/userCreate.dart';

//import 'Screens/TechnicianDashboard.dart';


class Login extends StatelessWidget {
  Login({super.key});
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const MyHomePage(title: 'Home Page'), // Use MyHomePage here
      ),
      GoRoute(
        path: '/createAccount',
        builder: (BuildContext context, GoRouterState state) => const CreateAccountScreen(),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      routerConfig: _router, // Use the GoRouter here
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final blackTextStyle = const TextStyle(color: Colors.black);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: HomeAppBar,

      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white60,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(70),
          ),
          child: Image.asset(
            'assets/image/AppIcons/image_fx_15.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
            const Spacer(),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle_rounded, color: Colors.purple),
                  labelText: "Email",
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField( // Changed to TextFormField for validation
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.purple),
                  labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                obscureText: true,
                validator: (value) { // Added validator
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ),


            SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("Login"),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.ROUTE_Home);
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forgotten Password?',
                style: blackTextStyle,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SizedBox(
                width: 360,
                height: 51,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Create new account"),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.ROUTE_CreateAccount);
                  },
                ),
              ),
            ),
            Spacer()
          ],


        ),

      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

