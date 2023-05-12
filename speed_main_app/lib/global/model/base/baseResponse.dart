class BaseResponse {
  // Success
  static const cSuccess = 0;

  // Failed
  static const cFailed = 8888;

  // Error occurred
  static const cError = 7777;

  // No data
  static const cNoData = 9999;

  int responseCode;
  String responseDesc;

  BaseResponse({this.responseCode, this.responseDesc});

  void fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDesc = json['responseDesc'];
  }

  void fromObj(BaseResponse obj) {
    responseCode = obj.responseCode;
    responseDesc = obj.responseDesc;
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(responseCode: json['responseCode'] ?? 999, responseDesc: json['responseDesc']);

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['responseDesc'] = responseDesc;

    return data;
  }

  static Map<String, dynamic> json(int responseCode, String responseDesc) {
    return BaseResponse(responseCode: responseCode, responseDesc: responseDesc).toJson();
  }

  @override
  String toString() {
    return '''BaseResponse {
        responseCode: $responseCode,
        responseDesc: $responseDesc,      
      }''';
  }
//BaseResponse.withError();
}
