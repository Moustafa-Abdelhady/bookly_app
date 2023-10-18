import 'package:equatable/equatable.dart';

class ListPrice extends Equatable {
  final num? amount;
  final String? currencyCode;

  const ListPrice({this.amount,this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        amount: json['amount'] == null ? null : json['amount'] as num,
        currencyCode: json['currencyCode'] == null
            ? null
            : json['currencyCode'] as String,
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
      
        @override
      
        List<Object?> get props => [amount ,currencyCode ];
}
