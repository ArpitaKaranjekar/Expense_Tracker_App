import 'package:expense_tracker_app/blocs/expense_list/expense_list_bloc.dart';
import 'package:expense_tracker_app/utils/format_total_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalExpensesWidget extends StatelessWidget {
  const TotalExpensesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final state = context.watch<ExpenseListBloc>().state;

    final totalExpenses = formatTotalExpenses(state.totalExpenses);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Expenses',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
          Text(totalExpenses, style: textTheme.displaySmall),
        ],
      ),
    );
  }
}
