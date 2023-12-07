import 'package:flutter_test/flutter_test.dart';
import 'package:meu_orcamento/models/account.dart';
import 'package:uuid/uuid.dart';

void main() {
  var uid = const Uuid().v4();
  group('Account', () {
    final account = Account(uid, 'Principal', 0.0);
    test('toMap ', () {
      expect(
          account.toMap(), {'name': 'Principal', 'balance': 0.0, 'uid': uid});
    });

    test('fromMap ', () {
      expect(
          Account.fromMap({
            'name': 'Principal',
            'balance': 0.0,
            'uid': uid,
          }),
          isA<Account>());
    });

    test('toJson ', () {
      final json = account.toJson();
      expect(json, '{"name":"Principal","balance":0.0,"uid":"$uid"}');
    });

    test('fromJson ', () {
      expect(
          Account.fromJson(
            '{"name":"Principal","balance":0.0,"uid":"$uid"}',
          ),
          isA<Account>());
    });

    test('addBalance', () {
      account.addBalance(100.0);
      expect(account.balance, 100.0);
    });

    test('reduceBalance', () {
      account.reduceBalance(100.0);
      expect(account.balance, 0.0);

      expect(() => account.reduceBalance(10), throwsA(isA<FormatException>()));
    });
  });
}
