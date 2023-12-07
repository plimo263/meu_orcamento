import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:meu_orcamento/models/category.dart';
import 'package:meu_orcamento/models/spending.dart';
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
    type: CategoryType.spending,
  );
  const value = 250.0;
  final dateRegister = DateTime.now();
  const description = 'Ola';

  group('Spending', () {
    final spending = Spending(
      uid: uid,
      name: name,
      category: category,
      value: value,
      dateRegister: dateRegister,
      description: description,
    );
    test('toMap ', () {
      expect(spending.toMap(), {
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
          Spending.fromMap({
            'uid': uid,
            'name': name,
            'category': category.toMap(),
            'value': value,
            'dateRegister': dateRegister.millisecondsSinceEpoch,
            'description': description,
          }),
          isA<Spending>());
    });

    test('toJson ', () {
      final json = spending.toJson();
      expect(json,
          '{"name":"$name","category":${category.toJson()},"value":$value,"dateRegister":${dateRegister.millisecondsSinceEpoch},"description":"$description","uid":"$uid"}');
    });

    test('fromJson ', () {
      expect(
          Spending.fromJson(
              '{"name":"$name","category":${category.toJson()},"value":$value,"dateRegister":${dateRegister.millisecondsSinceEpoch},"description":"$description","uid":"$uid"}'),
          isA<Spending>());
    });

    test('getValueMonetary', () {
      expect(spending.getValueMonetary(), 'R\$ 250,00');
    });

    test('getDateRegister', () {
      expect(spending.getDateRegister(),
          DateFormat('dd/MM/yy').format(dateRegister));
    });

    test('getTime', () {
      expect(spending.getTime(), DateFormat('HH:mm').format(dateRegister));
    });
  });
}
