import 'package:untitled/constants/application.dart';

String httpErrorPrinter(
    String url, dynamic error, StackTrace stackTrace, String identityCode) {
  String message = '''
  URL [${Emoji.link}] :: $url
  ================================================
  Identity Code [${Emoji.redCross}] :: ${identityCode}
  --------------------------------
  Error [${Emoji.caution}]:: ${error} 
  --------------------------------
  StackTrace [${Emoji.expressionlessFace}]:: ${stackTrace}
  ================================================ ''';

  return message;
}
