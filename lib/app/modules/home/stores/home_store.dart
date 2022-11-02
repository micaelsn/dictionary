import 'package:dictionary/shared/helpers/errors.dart';
import 'package:dictionary/shared/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:provider/provider.dart';

import '../domain/errors/errors.dart';

class HomeStore extends NotifierStore<Failure, int> {
  HomeStore() : super(0);

  init(BuildContext context) {
    Provider.of<NotificationService>(context, listen: false).showNotification(
        CustomNotification(
            id: 1,
            title: 'Olá',
            body: 'Acesse suas Palavras Favoritas',
            payload: '/favorites/'));
  }
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
