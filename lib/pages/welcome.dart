// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});
  

  @override
  Widget build(BuildContext context) {
    
   
    return  SafeArea(
      child: Scaffold(
         body: SizedBox(
          
          height: double.infinity,
          width: double.infinity,
           child:Stack(
             children:[
               SizedBox(
                
                width:double.infinity ,
                 child: Column(
                  
                   children:[
                    SizedBox(
                      height:50),
                     const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 35, fontFamily: "myfont",
                       fontWeight: FontWeight.w500,
                       color:  Color.fromRGBO(35, 17, 44, 0.612)

                       ),
                      ),
                     SizedBox(
                      height:60),
                     
                     Image.asset("assets/images/home.jpg", width: 150,),
                     
                       SizedBox(
                      height:60),
                     
                           
                             ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 142, 39, 176)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 85, vertical: 18)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  child: Text(
                    "login",
                    style: TextStyle(fontSize: 24),
                  ),
                             ),
                             SizedBox(
                  height: 22,
                             ),
                             ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 192, 194, 177)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 85, vertical: 18)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(fontSize: 17, color: Colors.grey[850]),
                  ),
                             ),
                  ],
               
                 ),
               ),
                Positioned(
                   left: 0,
                  child: Image.asset("assets/images/main_top.png", width: 111,),    
                  ),
              Positioned(
                bottom: 0,
                child: Image.asset("assets/images/main_bottom.png", width: 90,),    
                 ),
            
               
             ],
       )
          
    
             
   
       )
      ));
  }

 
}