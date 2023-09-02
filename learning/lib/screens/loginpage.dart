import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning/screens/Welcome.dart';

class loginpage extends StatelessWidget{
TextEditingController loginemail=TextEditingController();
TextEditingController loginpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Scholarly',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                   controller: loginemail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User EmailId',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: loginpassword,
                  obscureText: true,
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot Password',style: TextStyle(color: Colors.deepPurple),),
              ),
              Container(
                  height: 50,
                  color: Colors.deepPurple,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(

                    child: const Text('Login'),
                    onPressed: () async {
                      var userloginemail=loginemail;
                      var userloginpassword=loginpassword;

                    //   try{
                    //     final User? firebaseUser= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: userloginemail.text, password: userloginpassword.text)).user;
                    //     if(firebaseUser!=null){
                    //       print("hello");
                    //       Get.to(() => Welcome());
                    //
                    //     }else{
                    //       print("Check email & password");
                    //     }
                    //   }on FirebaseAuthException catch(e){
                    //     print("Error $e");
                    //   }
                    //
                     },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                      ),
                  )
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20,color: Colors.deepPurple),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )

      ),

    );
  }

}