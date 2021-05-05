import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample/common/paid_category.dart';
import 'package:flutter_sample/components/cards/billing_details_card.dart';
import 'package:flutter_sample/components/cards/pay_off_card.dart';
import 'package:flutter_sample/models/billing_details.dart';
import 'package:flutter_sample/models/member.dart';
import 'package:flutter_sample/models/paid_category.dart';
import 'package:flutter_sample/models/payment.dart';
import 'package:flutter_sample/view_models/billing_details_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PayOffStep extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tmpListPv = useProvider(billingDetailsListProvider);

    // サンプルデータ
    final _paymentList = <Payment>[
      Payment(
          toMember: Member(name: "八田"),
          fromMember: Member(name: "渡邉"),
          amount: 1000,
          isDone: false),
    ];

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Text("イベント名",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            title: Text("2021/4/5"),
          ),
          ListTile(
            leading: Text("合計",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            title:
                Text(NumberFormat('#,##0').format(tmpListPv.calcTotal()) + "円"),
          ),
          ListView.builder(
            itemCount: _paymentList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: PaymentCard(_paymentList[index], index));
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
          ),
        ]);
  }
}