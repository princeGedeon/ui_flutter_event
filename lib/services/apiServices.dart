import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_event_app/constants/constant.dart';
import 'package:ui_event_app/constants/constants_api.dart';

import '../models/event.dart';
import '../utils/helper_preferences.dart';

class ApiServices {
  

   static Future<List<EventModel>> getEventWhoMyGuest() async {
    List<EventModel> events = [];
    var dio = Dio();
    try {
      var response;
      
        response =
            await dio.get(APiConstants.BASEURL + "api/events/event_list_guest");
     
      print(response.statusCode);
      print(response.data);

      if (response.statusCode != 400) {
        response.data['results'].forEach((element) {
          events.add(EventModel.fromMap(element));
        });

        return events;
      } else {
        return events;
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Erreur: ${e.toString()}");
    }
  }

  static Future<List<EventModel>> getAllEvent(int page) async {
    List<EventModel> events = [];
    var dio = Dio();
    try {
      var response;
      if (page == 0) {
        response =
            await dio.get(APiConstants.BASEURL + "api/events/event_list");
      } else {
        response = await dio
            .get(APiConstants.BASEURL + "api/events/event_list?page=${page}");
      }

      print(response.statusCode);
      print(response.data);

      if (response.statusCode != 400) {
        response.data['results'].forEach((element) {
          events.add(EventModel.fromMap(element));
        });

        return events;
      } else {
        return events;
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Erreur: ${e.toString()}");
    }
  }

  static Future<bool> connect(String email, String password) async {
    var dio = Dio();
    try {
      final response = await dio.post(APiConstants.BASEURL + "api/user/login/",
          data: {'email': email, "password": password});

      Map<String, dynamic> data = response.data;

      if (response.statusCode != 400) {
        HelperPreferences.saveStringValue(
            "accessToken", data["token"]["access"].toString());
        HelperPreferences.saveStringValue(
            "refreshToken", data["token"]["refresh"].toString());
        HelperPreferences.saveBoolValue("connected", true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> register(String email, String password, String password2,
      String nom, String prenom) async {
    var dio = Dio();
    try {
      final response =
          await dio.post(APiConstants.BASEURL + "api/user/register/", data: {
        'email': email,
        "nom": nom,
        "password": password,
        "password2": password2,
        "prenom": prenom
      });

      Map<String, dynamic> data = response.data;
      print(data);

      if (response.statusCode != 400) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> editUser(var mydata) async {
    String token = await getToken();
    var dio = Dio();
    try {
      final response = await dio.post(APiConstants.BASEURL + "api/user/update/",
          data: mydata,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      Map<String, dynamic> data = response.data;
      getUser();
      print(data);

      if (response.statusCode != 400) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> changepassword(
      String password, String password2, String token, String uid) async {
    var dio = Dio();
    try {
      final response = await dio.post(
          APiConstants.BASEURL + "api/user/reset-password/${uid}/${token}/",
          data: {"password": password, "password2": password2});
      print(response.statusCode);
      if (response.statusCode != 400) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> sendpassmail(String email) async {
    var dio = Dio();
    try {
      final response = await dio.post(
          APiConstants.BASEURL + "api/user/send-reset-password-mail/",
          data: {'email': email});
      print(response.statusCode);

      if (response.statusCode != 400) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<Map<String, dynamic>> getAllEventbyPage(int page) async {
    List<EventModel> events = [];
    var dio = Dio();
    try {
      var response;
      if (page == 0) {
        response =
            await dio.get(APiConstants.BASEURL + "api/events/event_list");
      } else {
        response = await dio
            .get(APiConstants.BASEURL + "api/events/event_list?page=${page}");
      }

      print(response.statusCode);
      print(response.data);

      if (response.statusCode != 400) {
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
      return {};
    }
  }

  static Future<EventModel> getEventbyId(int id) async {
    var dio = Dio();
    try {
      var response;

      response =
          await dio.get(APiConstants.BASEURL + "api/events/detail_event/${id}");

      print(response.statusCode);
      print(response.data);

      if (response.statusCode != 400) {
        return EventModel.fromMap(response.data);
      } else {
        throw Exception(
            "Erreur: la requête a retourné un code d'erreur ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<String> getToken() async {
    if (await HelperPreferences.checkKey("accessToken") &&
        await HelperPreferences.checkKey("refreshToken")) {
      var dio = Dio();
      try {
        String token =
            await HelperPreferences.retrieveStringValue("accessToken");
        print("initial token ${token}");
        var response = await dio.post(
            APiConstants.BASEURL + "api/user/api/token/verify/",
            data: {"token": token});
        print("Reponse verif $response");
        print("test");
        return token;
      } catch (e) {
        print("token expiré");
        String refresh =
            await HelperPreferences.retrieveStringValue("refreshToken");
        print("refresh refresh $refresh");
        /* final response = await dio.post(
            APiConstants.BASEURL + "api/user/api/token/refresh/",
            data: {"refresh": refresh});
        if (response.statusCode == 200 || response.statusCode == 201) {
          String newToken = response.data["access"];
          print("token token $newToken");
          await HelperPreferences.saveStringValue("accessToken", newToken);
          return newToken;
        } else {
          return "";
        } */
        return "";
      }
    } else {
      return "";
    }
  }

  static Future<void> getUser() async {
    var dio = Dio();
    String token = await getToken();
    final response = await dio.get(APiConstants.BASEURL + "api/user/profile/",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data.toString());
      var data = response.data;
      HelperPreferences.saveStringListValue("userData", [
        data["email"],
        data["nom"],
        data["prenom"],
        data["picture_url"],
        data["profile"]
      ]);
      userData = await HelperPreferences.retrieveStringListValue("userData");
      print(userData);
    } else {}
  }

  static Future<bool> passtopremium() async {
    var dio = Dio();
    String token = await getToken();
    final response =
        await dio.post(APiConstants.BASEURL + "api/events/pass_to_premium",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }));
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
