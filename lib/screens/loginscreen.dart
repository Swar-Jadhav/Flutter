
import 'package:flutter/material.dart';
import '../Constants.dart' as Constants;
import '../components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Mainscreen.dart';
import '../Network/Location.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String email, password;
  int myvar=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }
void apiCall() async{
    var location = await determinePosition();
    myvar = await Constants.apiInstance.getLocation(
        location.latitude.toString(), location.longitude.toString());
}


  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Constants.textPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 2,
              child: textfield(text: 'Email', isPassword: false, onchanged: (value ) {email=value;  },)),
          Expanded(
              child: textfield(text: 'Password', isPassword: true, onchanged: (value ) { password=value; },)),
          ClipRRect(
            borderRadius: BorderRadius.circular(28.8),

            child: Container(
              width: 180,
              height: 70  ,
              color: Constants.dayPrimary,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.8),
                    side: BorderSide(
                      width: 2.9,
                      color: Colors.orange,
                    )
                  )
                ),
                onPressed: () async {

                  try{
                    final newUser =
                  await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (newUser.user != null && myvar !=0) {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context)  => MainScreen()));
                    }

                  }
                  catch(e){

                  }

                }, child: Text('Login',
              style: TextStyle(
                fontSize: 44.9,
                color: Constants.textPrimary,
              ),
              ),
              ),
            ),
          ),
          Expanded(child: Container())


        ],


      ),
    );
  }
}

