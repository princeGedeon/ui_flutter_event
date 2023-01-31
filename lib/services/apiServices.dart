import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_event_app/constants/constants_api.dart';

import '../utils/helper_preferences.dart';

class ApiServices{

  static Future<bool> connect(String email,String password) async{
    var dio = Dio();
    try{
      final response = await dio.post(APiConstants.BASEURL+"api/user/login/",
          data: {'email':email,"password":password});

      Map<String,dynamic> data= response.data;

      if (response.statusCode!=400){

        HelperPreferences.saveStringValue("accessToken",data["token"]["access"].toString());
        HelperPreferences.saveStringValue("refreshToken",data["token"]["refresh"].toString());






        return true;
      }
      else{
        return false;
      }

    }
    catch (e){
      print(e.toString());
      return false;
    }



    
  }

}