import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:meu_orcamento/utils/category_type_enum.dart';

/// Categoria para separar e classificar tanto as entradas quanto as saidas
class Category {
  final String uid;

  String name;
  int icon;
  String color;
  CategoryType type;

  Category({
    required this.uid,
    required this.name,
    required this.icon,
    required this.color,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'icon': icon,
      'color': color,
      'type': EnumToString.convertToString(type),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      uid: map['uid'] as String,
      name: map['name'] as String,
      icon: map['icon'] as int,
      color: map['color'] as String,
      type: EnumToString.fromString(CategoryType.values, map['type'] as String)
          as CategoryType,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $uid, name: $name, icon: $icon, color: $color, type: $type)';
  }
}
