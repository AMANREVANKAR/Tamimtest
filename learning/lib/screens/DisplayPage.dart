import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';
import 'loginpage.dart';


class DisplayPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(


    body:Align(
      alignment: Alignment.topCenter,
      child: Container(
        height:size.height,
        width: double.infinity,

        child: Column(
          children: [
            Container(
              height:size.height*0.8,
              child: Image.asset(

                  "assets/images/img.png",
              fit: BoxFit.fill,
              //height:size.height*0.5,
                width: size.width*4,
                //color: Colors.black,
              ),
            ),

            Container(
             // width: double.infinity,
             height:size.height*0.2,
              width: double.infinity,
              color: Colors.white,
              child:Column(
                children:[
                Container(
                  height: size.height*0.06,
                  width: size.width*0.5,

                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  //color:Colors.black,
                   child:ElevatedButton(
// onPressed: (){},
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));},
                    child: Text('Login',
                      style: TextStyle(color: Colors.white),


                    ),
                     style: ElevatedButton.styleFrom(
                       primary: Colors.deepPurple,
                     ),
                  ),
                ),

                  SizedBox(
                    height:size.height*0.034
                  ),
                  Container(
                    height: size.height*0.06,
                    width: size.width*0.5,

                    decoration: BoxDecoration(
                      border: Border.all(width: 3.5,color:Colors.deepPurple,),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:ElevatedButton(
                      // onPressed: (){},
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                      },
                      child: Text('SignUp',style:TextStyle(color:Colors.deepPurple)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                    ),
                  ),
                    ),],
            ),
            ),
          ],
        ),
      ),
    )



    );

  }

}