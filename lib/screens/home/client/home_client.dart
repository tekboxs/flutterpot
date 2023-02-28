// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutterpot/hexcolor.dart';
import 'package:flutterpot/screens/home/models/option_model.dart';
import 'package:get/get.dart';

import '../models/lastest_response_model.dart';
import 'dio_client.dart';

enum HomeClientErrors {
  notFound,
  badRequest,
  internalServer,
}

class HomeClient {
  final Client _client;

  ///recive client from injection, because is easy to replace if needed
  HomeClient(this._client);

  getLastResults(String id) async {
    try {
      var response = await _client.getRequest(
        "https://loteriascaixa-api.herokuapp.com/api/$id/latest",
      );
      return LastestResultsModel.fromMap(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return HomeClientErrors.badRequest;
    }
  }

  ///first request on app that info categories
  getAllFields() async {
    try {
      var response = await _client.getRequest(
        'https://loteriascaixa-api.herokuapp.com/api',
      );
      //color not returned from api, so set this
      Map colors = {
        "mega-sena": HexColor.fromHex('01518E'),
        "lotofacil": HexColor.fromHex('019966'),
        "quina": HexColor.fromHex('083485'),
        "lotomania": HexColor.fromHex('702F81'),
        "timemania": HexColor.fromHex('8E254B'),
        "dupla-sena": HexColor.fromHex('97CE2C'),
        "loteria-federal": HexColor.fromHex('D71E2B'),
        "dia-de-sorte": HexColor.fromHex('E1861A'),
        "super-sete": HexColor.fromHex('F48130')
      };

      return List<OptionModel>.from(
        response.data.map(
          (e) => OptionModel.fromMap(
            {
              'id': e,
              'nome': e.toString().replaceAll('-', ' ').capitalize,
              'color': colors[e] ?? Colors.indigo
            },
          ),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      return HomeClientErrors.badRequest;
    }
  }
}
