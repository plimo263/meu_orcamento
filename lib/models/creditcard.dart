import 'dart:convert';
import 'package:brasil_fields/brasil_fields.dart';

/// Classe para cartões de credito
class CreditCard {
  final String uid;
  final String name;
  final int dayOfPayment;
  final int dayGoodBuy;
  final double limit;
  final double balance;
  final String color;

  CreditCard({
    required this.uid,
    required this.name,
    required this.dayOfPayment,
    required this.dayGoodBuy,
    required this.limit,
    this.balance = 0.0,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'dayOfPayment': dayOfPayment,
      'dayGoodBuy': dayGoodBuy,
      'limit': limit,
      'balance': balance,
      'color': color,
    };
  }

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      uid: map['uid'] as String,
      name: map['name'] as String,
      dayOfPayment: map['dayOfPayment'] as int,
      dayGoodBuy: map['dayGoodBuy'] as int,
      limit: map['limit'] as double,
      balance: map.containsKey('balance') ? map['balance'] as double : 0.0,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCard.fromJson(String source) =>
      CreditCard.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Recupera o valor monetario do limite do cartão.
  String getLimitMonetary() {
    return UtilBrasilFields.obterReal(limit);
  }

  /// Recupera o valor monetario do saldo do cartão (quanto resta para gastar).
  String getBalanceMonetary() {
    return UtilBrasilFields.obterReal(balance);
  }

  @override
  String toString() {
    return 'CreditCard(uid: $uid, name: $name, dayOfPayment: $dayOfPayment, dayGoodBuy: $dayGoodBuy, limit: $limit, balance: $balance, color: $color)';
  }
}
