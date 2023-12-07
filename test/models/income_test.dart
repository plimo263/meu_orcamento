import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:meu_orcamento/models/category.dart';
import 'package:meu_orcamento/models/income.dart';
import 'package:meu_orcamento/utils/category_type_enum.dart';
import 'package:uuid/uuid.dart';

void main() {
  var uid = const Uuid().v4();
  const name = 'Supermercado';
  final category = Category(
    uid: const Uuid().v4(),
    name: 'Compras',
    icon: 23655,
    color: '#147859',
    type: CategoryType.income,
  );
  const value = 250.0;
  final dateRegister = DateTime.now();
  const description = 'Ola';

  group('Income', () {
    final income = Income(
      uid: uid,
      name: name,
      category: category,
      value: value,
      dateRegister: dateRegister,
      description: description,
    );
    test('toMap ', () {
      expect(income.toMap(), {
        'name': name,
        'category': category.toMap(),
        'value': value,
        'dateRegister': dateRegister.millisecondsSinceEpoch,
        'description': description,
        'uid': uid,
      });
    });

    test('fromMap ', () {
      expect(
          Income.fromMap({
            'uid': uid,
            'name': name,
            'category': category.toMap(),
            'value': value,
            'dateRegister': dateRegister.millisecondsSinceEpoch,
            'description': description,
          }),
          isA<Income>());
    });

    test('toJson ', () {
      final json = income.toJson();
      expect(json,
          '{"name":"$name","category":${category.toJson()},"value":$value,"dateRegister":${dateRegister.millisecondsSinceEpoch},"description":"$description","uid":"$uid"}');
    });

    test('fromJson ', () {
      expect(
          Income.fromJson(
              '{"name":"$name","category":${category.toJson()},"value":$value,"dateRegister":${dateRegister.millisecondsSinceEpoch},"description":"$description","uid":"$uid"}'),
          isA<Income>());
    });

    test('getValueMonetary', () {
      expect(income.getValueMonetary(), 'R\$ 250,00');
    });

    test('getDateRegister', () {
      expect(income.getDateRegister(),
          DateFormat('dd/MM/yy').format(dateRegister));
    });

    test('getTime', () {
      expect(income.getTime(), DateFormat('HH:mm').format(dateRegister));
    });
  });
}
