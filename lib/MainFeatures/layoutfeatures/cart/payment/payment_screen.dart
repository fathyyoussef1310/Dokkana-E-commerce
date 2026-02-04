import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Common Widgets/RoutesManager.dart';
import 'PaymentRow.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  String selectedMethod = "paypal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Payment Method', style: TextStyle(fontSize: 24.sp)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            PaymentRow(
              icon: Icons.payments_outlined,
              text: 'Cash on Delivery',
              trailing: Icon(
                selectedMethod == "cash"
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ),
              onTap: () {
                setState(() => selectedMethod = "cash");
              },
            ),

            Divider(),

            PaymentRow(
              icon: Icons.credit_card,
              text: 'Card',
              trailing: Icon(
                selectedMethod == "card"
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ),
              onTap: () {
                setState(() => selectedMethod = "card");
              },
            ),

            Divider(),

            PaymentRow(
              icon: Icons.account_balance_wallet_outlined,
              text: 'Paypal',
              trailing: Icon(
                selectedMethod == "paypal"
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ),
              onTap: () {
                setState(() => selectedMethod = "paypal");
              },
            ),

            Divider(),

            PaymentRow(
              icon: Icons.account_balance,
              text: 'Bank',
              trailing: Icon(
                selectedMethod == "bank"
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ),
              onTap: () {
                setState(() => selectedMethod = "bank");
              },
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacementNamed(
                    context,
                    RoutesManager.sammaryScreen,
                    arguments: selectedMethod,
                  );

                },
                child: Text('Place order',style: TextStyle(color: Colorsmanager.White),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
