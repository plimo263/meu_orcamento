import 'package:meu_orcamento/models/category.dart';

/// Esta interface é o mais alto nivel da aplicação que determina o recurso
/// registrado.
abstract class ResourcePaid {
  Category get category;
  set category(Category cate);

  String uid = '';
  String name = '';
  String description = '';

  // Retorna a data/hora do registro
  DateTime get dateRegister;

  // Retorna o valor
  double get value;

  /// Retorna o valor do recurso no formato R$ 0,00
  String getValueMonetary();

  /// Retorna a data no formato dd/MM/YY
  String getDateRegister();

  // Retorna a hora no formato HH:MM
  String getTime();
}
