import 'package:flutter/material.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.error,color: Colors.red,),
        onPressed: () {
          // throw InternetExceptions('Iftekhar Ahmed ');
          throw AppExceptions('Hello World','Dood BYE');
        },

      ),
    );
  }
}
