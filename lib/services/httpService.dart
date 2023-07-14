import 'package:http/http.dart' as http;

class HttpCall {
  late String _URL;
  late Map _dataToBeSent;
  final String _contentType = 'application/json; charset=UTF-8';
  late String _authToken;
  bool _isAuthRequired = true;

  String get URL => _URL;

  set URL(String value) {
    _URL = value;
  }

  set setAuthToken(String authToken) {
    _authToken = authToken;
  }

  set setAuthRequired(bool authRequired) {
    _isAuthRequired = authRequired;
  }

  Map get dataToBeSent => _dataToBeSent;

  set dataToBeSent(Map value) {
    _dataToBeSent = value;
  }

  /// Function() Future<dynamic> SendGetRequest()
  /// Return() An object { statusCode:''.responseBody:''}

  Future<dynamic> sendGetRequest() async {
    try {
      final http.Response response = await http.get(Uri.parse(_URL),
          headers: <String, String>{
            'Content-Type': _contentType,
            'Authorization': _isAuthRequired ? _authToken : ""
          });

      return {'statusCode': response.statusCode, 'responseBody': response.body};
    } catch (e, stacktrace) {
      print('GET Request Error on URL ${this._URL} Error :: ${e.toString()}');
      print("=========================================================");
      print(' STACKTRACE :: ${stacktrace.toString()}');
    }
  }
}
