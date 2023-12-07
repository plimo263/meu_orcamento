// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

import 'package:meu_orcamento/models/category.dart';
import 'package:meu_orcamento/models/interface/resource_paid.dart';

/// Entradas de valores no sistema.
class Income implements ResourcePaid {
  @override
  String name;

  @override
  Category category;

  @override
  double value;

  @override
  DateTime dateRegister;

  @override
  String description;

  @override
  String uid;

  Income({
    required this.name,
    required this.category,
    required this.value,
    required this.dateRegister,
    required this.description,
    required this.uid,
  });

  /// Recupera a data de registro formatada em DD/MM/YY
  @override
  String getDateRegister() {
    return DateFormat('dd/MM/yy').format(dateRegister);
  }

  /// Obtem o tempo formatado em HH:MM
  @override
  String getTime() {
    return DateFormat('HH:mm').format(dateRegister);
  }

  /// Recupera o valor em formato monetario
  @override
  String getValueMonetary() {
    return UtilBrasilFields.obterReal(value);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category.toMap(),
      'value': value,
      'dateRegister': dateRegister.millisecondsSinceEpoch,
      'description': description,
      'uid': uid,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      name: map['name'] as String,
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      value: map['value'] as double,
      dateRegister:
          DateTime.fromMillisecondsSinceEpoch(map['dateRegister'] as int),
      description: map['description'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Income.fromJson(String source) =>
      Income.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Income(name: $name, category: $category, value: $value, dateRegister: $dateRegister, description: $description, uid: $uid)';
  }
}
