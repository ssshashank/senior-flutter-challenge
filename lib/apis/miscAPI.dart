import 'dart:io';
import 'package:untitled/constants/network.dart';
import 'package:untitled/services/httpService.dart';
import 'package:untitled/utils/errorPrinter.dart';

class MiscAPI {
  final HttpCall _httpCall = HttpCall();

  Future<dynamic> fetchAdventure(int pageValue) async {
    _httpCall.setAuthRequired = false;
    NetworkInfo.pageValue = pageValue;
    _httpCall.URL = NetworkInfo.apiEndpoint;

    try {
      var response = await _httpCall.sendGetRequest();
      if (response["statusCode"] == HttpStatus.ok) {
        return response;
      }
    } catch (error, stackTrace) {
      print(httpErrorPrinter(
          _httpCall.URL, error, stackTrace, 'MiscAPI.fetchAdventure'));
      return null;
    }
  }
}
