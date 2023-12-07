import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_orcamento/models/category.dart';
import 'package:meu_orcamento/utils/category_type_enum.dart';
import 'package:uuid/uuid.dart';

void main() {
  var uid = const Uuid().v4();
  const name = 'Alimentação';
  const color = '#161514';
  const icon = 23755;
  const type = CategoryType.income;
  group('Category', () {
    final category = Category(
      uid: uid,
      color: color,
      icon: icon,
      name: name,
      type: type,
    );
    test('toMap ', () {
      expect(category.toMap(), {
        'name': name,
        'color': color,
        'icon': icon,
        'uid': uid,
        'type': EnumToString.convertToString(type)
      });
    });

    test('fromMap ', () {
      expect(
          Category.fromMap({
            'name': name,
            'uid': uid,
            'icon': icon,
            'color': color,
            'type': EnumToString.convertToString(type),
          }),
          isA<Category>());
    });

    test('toJson ', () {
      final json = category.toJson();
      expect(json,
          '{"uid":"$uid","name":"$name","icon":$icon,"color":"$color","type":"${EnumToString.convertToString(type)}"}');
    });

    test('fromJson ', () {
      expect(
          Category.fromJson(
            '{"name":"$name","uid":"$uid","color":"$color","icon":$icon,"type":"${EnumToString.convertToString(type)}"}',
          ),
          isA<Category>());
    });
  });
}
