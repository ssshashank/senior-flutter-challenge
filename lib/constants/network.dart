class NetworkInfo {
  static int? pageValue;

  static String get apiEndpoint =>
      "https://api.instantwebtools.net/v1/passenger?page=${pageValue ?? 1}&size=10";
}

class MethodType {
  static const get = r"/get";
  static const post = r"/post";
  static const put = r"/update";
  static const delete = r"/delete";
}
