import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studioproject1/pages/loginpage.dart';
import 'package:studioproject1/main.dart';
class authorizationpage extends GetxController{
  static authorizationpage instance= Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user,_initialScreen);
  }
   _initialScreen(User? user){
    if(user==null){
      print("login");
      Get.offAll(()=>loginpage());
    }
    else{
      Get.offAll(()=>Home());
    }
   }
  void register(String email,password) async {
     try {
     await  auth.createUserWithEmailAndPassword(email: email, password: password);
     }catch(e){
       Get.snackbar("About User", "User message",
       backgroundColor: Colors.redAccent,
       snackPosition: SnackPosition.BOTTOM,
         titleText: Text(
           "Account Creation Failed ",
           style: TextStyle(
             color:Colors.white
         ),
         ),
         messageText: Text(
          e.toString(),
           style: TextStyle(
             color:Colors.white
           )
    )
       );
     }

     }
  void login(String email,password) async {
    try {
      await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed",
            style: TextStyle(
                color:Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color:Colors.white
              )
          )
      );
    }

  }
 void  Logout() async {
   await auth.signOut();
  }
}