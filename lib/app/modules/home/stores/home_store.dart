import 'package:dictionary/shared/helpers/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/errors/errors.dart';

class HomeStore extends NotifierStore<Failure, int> {
  HomeStore() : super(0);

  // setPage(int page) => update(page);

  void onChangePage(int page) {
    switch (page) {
      case 0:
        Modular.to.navigate('/word-list/');
        break;
      case 1:
        Modular.to.navigate('/history/');
        break;
      case 2:
        Modular.to.navigate('/favorites/');
        break;
    }
    update(page);
  }
}
