import 'package:flutter/material.dart';
import 'package:jatayat/consumer/authentication/login.dart';
import 'package:jatayat/main.dart';
import 'package:jatayat/transport_dept/authentication/sign_up.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/bus.png'),
            Text('Jatayat',style: TextStyle(fontSize: 30,color: themeColor),),
            const SizedBox(height: 100,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              minWidth: 300,
              color: themeColor,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
              child: const Text('Log In'),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              minWidth: 300,
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
              },
              child: const Text('Sign Up as Transport Department'),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              minWidth: 300,
              color: Colors.amber,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
              child: const Text('Sign Up as Consumer'),
            ),
          ],
        ),
      ),
    );
  }
}