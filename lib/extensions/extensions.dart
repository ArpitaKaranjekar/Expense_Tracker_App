import 'package:expense_tracker_app/blocs/expense_form/expense_form_bloc.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/repositories/expense_repository.dart';
import 'package:expense_tracker_app/widgets/add_expense_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AppX on BuildContext {
  Future<void> showAddExpenseSheet({Expense? expense}) {
    return showModalBottomSheet(
      context: this,
      builder: (context) => BlocProvider(
        create: (context) => ExpenseFormBloc(
          initialExpense: expense,
          repository: read<ExpenseRepository>(),
        ),
        child: const AddExpenseSheetWidget(),
      ),
      isScrollControlled: true,
      useRootNavigator: true,
      showDragHandle: true,
    );
  }
}
