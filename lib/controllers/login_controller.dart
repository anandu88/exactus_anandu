import 'dart:convert';

import 'package:exactus_anandu/utlts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_endpoints.dart';
import 'package:http/http.dart' as http;

import '../screens/homescreen.dart';

class Logincontroller extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future <void> loginwithEmail()async{
     var headers = {'Content-Type': 'application/json'};
     try {

       var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
           Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
          if (response.statusCode==200) {
             final json = jsonDecode(response.body);
             if (json['code'] == 0) {
              var token = json['data']['Token'];
              final SharedPreferences prefs = await _prefs;
              await prefs.setString('token', token);

               emailController.clear();
                passwordController.clear();
                 Get.off(HomeScreen());
               
             }
             else if(json['code'] == 1){
               throw jsonDecode(response.body)['message'];
             }
          }else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }

       
     } catch (e) {
       Get.back();
       showsnackbar(context: Get.context!, content: e.toString());
       
     }

  }
}