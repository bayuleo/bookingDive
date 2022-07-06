export 'auth/forgot_password/response_forgot_password.dart';
export 'auth/forgot_password/response_forgot_password_data.dart';
export 'auth/forgot_password/request_forgot_password.dart';
export 'auth/sign_in/request_auth_sign_in.dart';
export 'auth/sign_in/response_auth_sign_in_data.dart';
export 'auth/sign_in/response_auth_sign_in.dart';
export 'auth/register/request_register.dart';
export 'auth/register/response_register_data.dart';
export 'auth/register/response_register.dart';
export 'common/message.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
