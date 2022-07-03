export 'auth/sign_in/request_auth_sign_in.dart';
export 'auth/sign_in/response_auth_sign_in_data.dart';
export 'auth/sign_in/response_auth_sign_in.dart';
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
