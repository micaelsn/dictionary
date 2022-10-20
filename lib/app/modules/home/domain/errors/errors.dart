import 'package:dictionary/shared/helpers/main.dart';

class PageDoNotFoundFailure extends Failure {
  @override
  final String? message;
  PageDoNotFoundFailure({
    this.message,
  });
}
