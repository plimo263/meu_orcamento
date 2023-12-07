import 'package:flutter_test/flutter_test.dart';
import 'package:meu_orcamento/models/creditcard.dart';
import 'package:uuid/uuid.dart';

void main() {
  var uid = const Uuid().v4();
  const name = 'Alimentação';
  const color = '#161514';
  const dayOfPayment = 25;
  const dayGoodBuy = 15;
  const limit = 300.0;

  group('CreditCard', () {
    final creditCard = CreditCard(
      uid: uid,
      color: color,
      dayOfPayment: dayOfPayment,
      name: name,
      dayGoodBuy: dayGoodBuy,
      limit: limit,
    );
    test('toMap ', () {
      expect(creditCard.toMap(), {
        'uid': uid,
        'name': name,
        'color': color,
        'dayOfPayment': dayOfPayment,
        'balance': 0.0,
        'dayGoodBuy': dayGoodBuy,
        'limit': limit,
      });
    });

    test('fromMap ', () {
      expect(
          CreditCard.fromMap({
            'uid': uid,
            'color': color,
            'dayOfPayment': dayOfPayment,
            'name': name,
            'dayGoodBuy': dayGoodBuy,
            'limit': limit,
          }),
          isA<CreditCard>());
    });

    test('toJson ', () {
      final json = creditCard.toJson();
      expect(json,
          '{"uid":"$uid","name":"$name","dayOfPayment":$dayOfPayment,"dayGoodBuy":$dayGoodBuy,"limit":$limit,"balance":0.0,"color":"$color"}');
    });

    test('fromJson ', () {
      expect(
          CreditCard.fromJson(
              '{"uid":"$uid","name":"$name","dayOfPayment":$dayOfPayment,"color":"$color","dayGoodBuy":$dayGoodBuy,"limit":$limit,"balance":0.0}'),
          isA<CreditCard>());
    });

    test('getBalanceMonetary', () {
      expect(creditCard.getBalanceMonetary(), 'R\$ 0,00');
    });

    test('getLimitMonetary', () {
      expect(creditCard.getLimitMonetary(), 'R\$ 300,00');
    });
  });
}
