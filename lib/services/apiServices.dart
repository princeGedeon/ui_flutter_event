import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_event_app/constants/constants_api.dart';

import '../models/event.dart';
import '../utils/helper_preferences.dart';

class ApiServices {

  static Future<List<EventModel>> getAllEvent(int page) async {
    List<EventModel> events = [];
    var dio = Dio();
    try {
      var response;
      if (page == 0) {
        response =
        await dio.get(APiConstants.BASEURL + "api/events/event_list");
      } else {
        response =
        await dio.get(
            APiConstants.BASEURL + "api/events/event_list?page=${page}");
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

  static Future<bool> changepassword(String password, String password2,
      String token, String uid) async {
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
        response =
        await dio.get(
            APiConstants.BASEURL + "api/events/event_list?page=${page}");
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
            "Erreur: la requête a retourné un code d'erreur ${response
                .statusCode}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
