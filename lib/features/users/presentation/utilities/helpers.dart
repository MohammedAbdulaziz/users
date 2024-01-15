import 'package:users/core/core.dart';
import 'package:users/features/users/users.dart';

class Helpers {
  static int stringToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      return 0;
    }
  }

  static String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.kServerFailureMessage;
      case ParsingJsonFailure:
        return Constants.kParsingJsonFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
