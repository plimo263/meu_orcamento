import 'dart:convert';

/// Classe que permite instanciar uma conta no aplicativo.
/// A conta poderá ser o lugar onde os valores são acumulados.
class Account {
  final String uid;
  String name;
  double _balance = 0.0;

  Account(
    this.uid,
    this.name,
    this._balance,
  );

  double get balance {
    return _balance;
  }

  void addBalance(double balance) {
    _balance += balance;
  }

  void reduceBalance(double balance) {
    if (balance > _balance) {
      throw const FormatException(
        'Não é possível reduzir mais do que tem na conta',
      );
    }
    _balance -= balance;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'balance': _balance,
      'uid': uid,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      map['uid'] as String,
      map['name'] as String,
      map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Account(uid: $uid, name: $name, balance: $_balance)';
}
