import 'package:yandex_kassa/models/json_encodable.dart';
import 'package:yandex_kassa/yandex_kassa.dart';

class TokenizationResult implements JsonEncodable {
  final bool success;
  final PaymentData? paymentData;
  final String? error;
  TokenizationResult({required this.success, this.error, this.paymentData});

  factory TokenizationResult.fromJson(Map json) {
    return TokenizationResult(
        success: json['success'],
        paymentData: PaymentData.fromJson(json['data']),
        error: json['error']);
  }
  @override
  Map<String, dynamic> get json => {
        'success': success,
        'data': paymentData?.json,
        'error': error
      }..removeWhere((key, val) => val == null);

  @override
  String toString() => json.toString();
}

class PaymentData implements JsonEncodable {
  final String token;
  final PaymentMethod paymentMethod;

  PaymentData({required this.token, required this.paymentMethod});

  factory PaymentData.fromJson(Map json) {
    return PaymentData(
        paymentMethod: PaymentMethod(json['paymentMethod']),
        token: json['token']);
  }
  @override
  Map<String, dynamic> get json => {
        'paymentMethod': paymentMethod.json,
        'token': token
      }..removeWhere((key, val) => val == null);

  @override
  String toString() => json.toString();
}
