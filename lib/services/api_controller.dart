import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:climbing/model/competition.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DatabaseService {
  static String baseUrl = 'https://localhost:7109/api/GetAll';
  static String usersEndpoint = 'competition/GetNext';

  Future<List<Competition>?> getCompetitions() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'XApiKey': "32c8e03b-c391-41f3-9eac-51fa34bc921a"
      };
      var request = http.Request(
          'GET', Uri.parse('https://localhost:7109/api/competition/GetAll'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        List<Competition> _model =
            userModelFromJson(await response.stream.bytesToString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Request? getRequest(String path) {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'XApiKey': "32c8e03b-c391-41f3-9eac-51fa34bc921a"
      };
      var request = http.Request(
          'GET', Uri.parse('https://localhost:7109/api/competition/' + path));
      request.headers.addAll(headers);
      return request;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Competition>?> getNextCompetition() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'GET', Uri.parse('https://localhost:7109/api/competition/GetNext?'));
      request.body = json.encode({
        "title": "TWO",
        "start": "2022-12-01T00:00:00",
        "end": "2022-12-30T00:00:00",
        "Location": {}
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      //var urltest = Uri.https(urllocal,"",queryParameters);
      // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      ///var response = await http.get(httpsUri, headers: headers);/*
      // "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      // "Access-Control-Allow-Credentials":'true', // Required for cookies, authorization headers with HTTPS
      // "Access-Control-Allow-Headers":"Access-Control-Allow-Origin, Accept",
      // "Access-Control-Allow-Methods": "POST, OPTIONS"}); */
      //if (response.statusCode == 200) {
      //List<Competition> _model = userModelFromJson(response.body);
      return null;
    } catch (e) {
      log(e.toString());
    }
  }

  List<Competition> userModelFromJson(String str) => List<Competition>.from(
      json.decode(str).map((x) => Competition.fromJson(x)));

  Future<List<Competition>?> getOnGoingCompetitions() async {
    try {
      Request? request = await getRequest('GetOngoingCompetitons');

      http.StreamedResponse? response;
      if (request != null) {
        response = await request.send();
      }
      if (response!.statusCode == 200) {
        List<Competition> _model =
            userModelFromJson(await response.stream.bytesToString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
