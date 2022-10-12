import 'dart:convert';
import 'package:simple_parking_app/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:simple_parking_app/model/vehicle.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_parking_app/service/api.dart';

import '../model/response.dart';

abstract class ApiServices {
  static Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(Uri.parse(Api.login),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['result'] != null) {
          return LoginResponse.fromJson(data);
        } else {
          return LoginResponse(
            error: data['error'],
            message: data['message'],
            result: null,
          );
        }
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Response> signup({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(Uri.parse(Api.signup), body: {
        'name': name,
        'no_telp': phoneNumber,
        'email': email,
        'password': password
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return Response.fromJson(data);
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<User> getUserData({required String userID}) async {
    try {
      final response = await http.get(
        Uri.parse("${Api.getUserData}?id=$userID"),
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Response> editProfile({
    required String userID,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(Api.editProfile),
        body: {
          'id': userID,
          'name': name,
          'no_telp': phoneNumber,
          'email': email,
          'password': password
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return Response.fromJson(data);
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Response> topUp({
    required String userID,
    required String nominal,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(Api.topup),
        body: {'id': userID, 'saldo': nominal},
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return Response.fromJson(data);
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Response> addVehicle({
    required String userID,
    required String brand,
    required String model,
    required String color,
    required String number,
    required String type,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(Api.addVehicle),
        body: {
          'id_user': userID,
          'brand': brand,
          'model': model,
          'color': color,
          'no_polisi': number,
          'jenis': type,
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return Response.fromJson(data);
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<GetVehicleResponse> getAllVehicle(
      {required String userID}) async {
    try {
      final response = await http.get(
        Uri.parse('${Api.showAllVehicle}?id_user=$userID'),
      );
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var vehicleData = responseData['result'];
        if (vehicleData != null) {
          return GetVehicleResponse.fromJson(responseData);
        } else {
          return GetVehicleResponse(
            error: responseData['error'],
            message: responseData['message'],
            result: [],
          );
        }
      } else {
        throw Exception('404 not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
