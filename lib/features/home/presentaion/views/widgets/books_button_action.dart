import 'package:book_store/core/stripe_payment/payment_manager.dart';
// import 'package:book_store/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../../../../core/utils/functions/launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () async {
              if (bookModel.saleInfo!.saleability == "FOR_SALE") {
                return await PaymentManager.makePayment(
                    (bookModel.saleInfo?.listPrice?.amount)!.toInt(),
                    (bookModel.saleInfo?.listPrice?.currencyCode).toString());
              } else {
                return;
              }
            },
            text: getPrice(bookModel, context),
            backGroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Intl.getCurrentLocale() == 'ar' ? const Radius.circular(0) : const Radius.circular(16),
              bottomLeft: Intl.getCurrentLocale() == 'ar' ? const Radius.circular(0) : const Radius.circular(16),
              topRight: Intl.getCurrentLocale() == 'ar'
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
              bottomRight: Intl.getCurrentLocale() == 'ar'
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
              
            ),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink);
            },
            fontSize: 16,
            text: getText(bookModel, context),
            backGroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight:Intl.getCurrentLocale() == 'ar'
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
              bottomRight:Intl.getCurrentLocale() == 'ar'
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
              topLeft: Intl.getCurrentLocale() == 'ar'
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
              bottomLeft:Intl.getCurrentLocale() == 'ar'
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
            ),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel, context) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return S.of(context).preview;
    }
  }

  String getPrice(BookModel bookModel, context) {
    if (bookModel.saleInfo!.saleability == "FOR_SALE") {
      return "${bookModel.saleInfo!.listPrice!.amount} ${bookModel.saleInfo!.listPrice!.currencyCode}";
    } else {
      return S.of(context).free;
    }
  }
}

// class PaymentBooks extends StatelessWidget {
//   const PaymentBooks({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       ScaffoldMessenger.of(context).showSnackBar(snackBar)
//     );
//   }
// }
