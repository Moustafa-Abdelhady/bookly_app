import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
// import '../../../../../main.dart';
import 'book_details_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment:Intl.getCurrentLocale() == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            S.of(context).uCanAlso,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 7),
        const SimilarBookDetailsListView(),
      ],
    );
  }
}
