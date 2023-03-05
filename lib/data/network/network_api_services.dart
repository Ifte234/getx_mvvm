

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
class NetworkApiServices extends BaseApiServices{

  @override
  //@override because we have used it already in BaseApi Class
  Future<dynamic> getApi(String url)async{
    if(kDebugMode){
      print(url);
    }

    dynamic responseJson ;
    try{
      final response =await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
responseJson = returnResponse(response);
    }on SocketException{
      throw InternetExceptions('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    return responseJson;
   }
  Future<dynamic> postApi(var data , String url)async{
    if(kDebugMode){
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try{
      final response =await http.post(Uri.parse(url),
      body: jsonEncode(data)
      //    if data is in raw form then use json decode
        //    otherwise(in form) just data variable will be used as
      //  body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetExceptions('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    return responseJson;
  }
   dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw InvalidUrl('');
      default:
        throw CommunicationException(''+ response.statusCode.toString());
    }
   }

}