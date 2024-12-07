import 'package:expense_tracker_app/models/expense.dart';

enum Category {
  all,
  shopping,
  pet,
  grocery,
  food,
  work,
  entertainment,
  travelling,
  other;

  String toJson() => name;
  static Category fromJson(String json) => values.byName(json);
}

extension CategoryX on Category {
  String get toName => switch (this) {
        Category.all => 'All',
        Category.entertainment => 'Entertainment',
        Category.food => 'Food',
        Category.grocery => 'Grocery',
        Category.work => 'Work',
        Category.travelling => 'Travelling',
        Category.pet => 'Pet',
        Category.shopping => 'Shopping',
        Category.other => 'Other',
      };

  bool apply(Expense? expense) => switch (this) {
        Category.all => true,
        Category.entertainment => expense?.category == Category.entertainment,
        Category.food => expense?.category == Category.food,
        Category.grocery => expense?.category == Category.grocery,
        Category.work => expense?.category == Category.work,
        Category.travelling => expense?.category == Category.travelling,
        Category.pet => expense?.category == Category.pet,
        Category.shopping => expense?.category == Category.shopping,
        Category.other => expense?.category == Category.other,
      };

  Iterable<Expense?> applyAll(Iterable<Expense?> expenses) {
    return expenses.where(apply);
  }
}
