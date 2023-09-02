
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



String dropdownvalue = "UPSC";
var items = ["UPSC","JEE"];

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignPageState createState() => _SignPageState();
}


class _SignPageState extends State<SignupPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phoneno = TextEditingController();
  TextEditingController Exams  = TextEditingController();
  TextEditingController Password = TextEditingController();

  User? currentUser=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(signupcontroller());
    // final _formkey=GlobalKey<FormState>();
    bool _validate = false;
     Size size1=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(

          child: Container(

            height: MediaQuery
                .of(context)
                .size
                .height,
            // height:double.infinity,

            width: double.infinity,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 20,),
                        Text("Create an Account,Its free", style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        SizedBox(height: 20,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          // makeInput(label: "Name"),
                          Container(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",style:TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87
                                ),),

                            SizedBox(height: 5,),
                                TextFormField(
                             controller: Name,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty ) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 30,),

                        ],
                      ),
          ),

                          Container(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone no",style:TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87
                                ),),

                                SizedBox(height: 5,),
                                TextFormField(
                                  controller: Phoneno,
                                  decoration: InputDecoration(

                                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey)
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty ) {
                                      return 'Please enter some text';
                                    }else
                                    if( !RegExp(r"^[0-9]")
                                        .hasMatch(value)){
                                      return 'Invalid phone no address';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          Container(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Email",style:TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87
                                ),),

                                SizedBox(height: 5,),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                              controller: Email,
                                  decoration: InputDecoration(
                                    hintText: "example.@gmail.com",
                                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey)
                                    ),
                                  ),
                                       validator: (value) {
                                         if (value == null || value.isEmpty ) {
                                           return 'Please enter some text';
                                         }else
                                           if( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                               .hasMatch(value)){
                                             return 'Invalid Email address';
                                           }
                                         return null;
                                       },
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       alignment: Alignment.centerLeft,
                          //       height:size1.height*0.05,
                          //       width: size1.width*0.15,
                          //       child:Center(child: Text("Exams",style: TextStyle(fontSize: 17,  fontWeight: FontWeight.w400,),)),
                          //       color: Colors.white,
                          //     ),
                          //     SizedBox(
                          //       width:20
                          //     ),
                          //
                          //     DropdownButton(
                          //
                          //       // Initial Value
                          //       value: dropdownvalue,
                          //
                          //       // Down Arrow Icon
                          //       icon: const Icon(Icons.keyboard_arrow_down),
                          //
                          //       // Array list of items
                          //       items: items.map((String items) {
                          //         return DropdownMenuItem(
                          //
                          //           value: items,
                          //           child: Text(items),
                          //         );
                          //       }).toList(),
                          //       // After selecting the desired option,it will
                          //       // change button value to selected value
                          //       onChanged: (String? newValue) {
                          //
                          //         setState(() {
                          //           dropdownvalue = newValue!;
                          //         }
                          //
                          //         );
                          //       },
                          //
                          //     ),
                          //   ],
                          // ),
                        SizedBox(
                          height:15,
                        ),
                          Container(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Create Password",style:TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87
                                ),),

                                SizedBox(height: 5,),
                                TextFormField(
                                  controller: Password,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey)
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty ) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 30,),

                              ],
                            ),
                          ),
                          ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black)
                            )
                        ),
                        child: MaterialButton(

                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {

                          var useremail=Email.text.trim();
                          var userpassword=Password.text;
                          var username=Name.text;
                          var userphoneno=Phoneno.text;
                          var userexams=Exams.text;

                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }

                        // FirebaseAuth.instance.createUserWithEmailAndPassword(email: useremail, password: userpassword).then((value)=>{
                        //      log("user created "),
                        //     FirebaseFirestore.instance.collection("users").doc().set({
                        //       'username': username,
                        //       'userphone':userphoneno,
                        //       'useremail':useremail,
                        //       'userexams':dropdownvalue,
                        //       'userpassword':userpassword,
                        //       'createddate': DateTime.now(),
                        //       'userID': currentUser!.uid,
                        //     }),
                        //   log("data added"),
                        // });
                          },
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text("Sign Up", style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16,

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        Text("Login", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),

                      ],
                    )
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget makeInput({label,obsureText = false,control=null}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(

        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}

