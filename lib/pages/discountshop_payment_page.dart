import 'package:admin_panel_web/providers/payment_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountShopPayment extends StatefulWidget {

  @override
  _DiscountShopPaymentState createState() => _DiscountShopPaymentState();
}

class _DiscountShopPaymentState extends State<DiscountShopPayment> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    PaymentProvider operation = Provider.of<PaymentProvider>(context);
    return Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: _isLoading?Center(child: CircularProgressIndicator()):Container(
            width: publicProvider.pageWidth(size),
            height: size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Patient Name',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Center(
                            child: Text(
                              'Shop Name',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),

                      Expanded(
                          child: Center(
                            child: Text(
                              'Amount',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),

                      Expanded(
                          child: Center(
                            child: Text(
                              'Currency',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Expanded(
                          child: Center(
                            child: Text(
                              'Payment Date',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Expanded(
                          child: Center(
                            child: Text(
                              'Transaction Id',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(height: 1,color: Colors.black),
                Container(
                  height: size.height * .7,
                  width: size.width*.9,
                  child: Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: operation.paymentDiscountList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Center(
                                          child: Text(
                                            operation.paymentDiscountList[index].pName,
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: size.height * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                    Expanded(
                                        child: Center(
                                          child: Text(
                                            operation.paymentDiscountList[index].shopName,
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: size.height * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                    Expanded(
                                        child: Center(
                                          child: Text(
                                            operation.paymentDiscountList[index].amount,
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: size.height * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                    Expanded(
                                        child: Center(
                                          child: Text(
                                            operation.paymentDiscountList[index].currency,
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: size.height * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                    Expanded(
                                        child: Center(
                                          child: Text(
                                            operation.paymentDiscountList[index].paymentDate,
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: size.height * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),
                                    Expanded(
                                        child: Center(
                                          child: Text(
                                            operation.paymentDiscountList[index].transactionId,
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: size.height * .02,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )),

                                  ],
                                ),
                                SizedBox(height: 15),
                                Divider(height: 1,color: Colors.grey.shade700,),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ))
    );
  }
}
