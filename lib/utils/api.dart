import 'dart:convert';
import 'package:code4odisha/buttons/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/login');
  static var responseJson;

  static login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({
          'email': email,
          'password': password,
        }));

    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('password', password);
      prefs.setString('response', responseJson);
      print(responseJson);
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const navigate(),
        ),
      );
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class Issue {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/issue');

  static issues(memID, teamID, problem, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({'mid': memID, 'tid': teamID, 'p': problem}));

    if (response.statusCode == 200) {
      await EasyLoading.showSuccess(response.body);
    } else {
      await EasyLoading.showError("Error");
    }
  }
}

class QrData {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('http://c4obackendtest.herokuapp.com/c4oQR');

  static sendQr(qrCode, userID, context) async {
    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode({'qrStr': qrCode, 'uid': userID}));

    if (response.statusCode == 200) {
      await EasyLoading.showSuccess(response.body);
    } else {
      await EasyLoading.showError("Error ${response.body}");
    }
  }
}
