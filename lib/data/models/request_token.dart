part of 'models.dart';

class RequestToken extends Equatable {
  final bool success;
  final String expiresAt;
  final String requestToken;
  const RequestToken({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  Map<String, dynamic> toMap() => {
        'success': success,
        'expires_at': expiresAt,
        'request_token': requestToken,
      };

  factory RequestToken.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return RequestToken(
      success: map['success'],
      expiresAt: map['expires_at'],
      requestToken: map['request_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestToken.fromJson(String source) =>
      RequestToken.fromMap(json.decode(source));

  @override
  List<Object> get props => [success, expiresAt, requestToken];
}
