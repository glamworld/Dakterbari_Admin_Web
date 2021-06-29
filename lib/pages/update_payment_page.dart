import 'package:admin_panel_web/providers/payment_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePaymentPage extends StatefulWidget {

  @override
  _UpdatePaymentPageState createState() => _UpdatePaymentPageState();
}

class _UpdatePaymentPageState extends State<UpdatePaymentPage> {
  final _addKey = GlobalKey<FormState>();
  String? chargeAmount;
  String? dollarUnit;
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final PaymentProvider paymentProvider = Provider.of<PaymentProvider>(context);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:200,
                          child: Text(
                            'AmountCharge',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        width: 200,
                          child: Text(
                            'Dollar Unit',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: size.height * .02,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(height: 1,color: Colors.black),
                Container(
                  height: size.height * .7,
                  width: size.width,
                  child: Expanded(
                    child: ListView.builder(
                      //shrinkWrap: true,
                        itemCount: paymentProvider.amountList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 150,),
                                    Container(
                                      width:200,
                                        child: Text(
                                          paymentProvider.amountList[index].amountCharge,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    Container(
                                      width: 200,
                                        child: Text(
                                          paymentProvider.amountList[index].dollarUnit,
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: size.height * .02,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    TextButton(
                                      onPressed: (){
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                scrollable: true,
                                                contentPadding: EdgeInsets.all(20),
                                                title: Text(
                                                  "Update amount details",
                                                  textAlign: TextAlign.center,
                                                ),
                                                content: Container(
                                                  child: Form(
                                                    key: _addKey,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 10),
                                                        TextFormField(
                                                          initialValue: paymentProvider.amountList[0].amountCharge,
                                                          keyboardType: TextInputType.text,
                                                          decoration: InputDecoration(labelText: 'Write appointment Amount'),
                                                          onSaved: (val) {
                                                            chargeAmount = val;
                                                          },
                                                          validator: (val) =>
                                                          val!.isEmpty ? 'please enter appointment charge' : null,
                                                        ),
                                                        SizedBox(height: 10),
                                                        TextFormField(
                                                          initialValue: paymentProvider.amountList[0].dollarUnit,
                                                          keyboardType: TextInputType.text,
                                                          decoration: InputDecoration(labelText: 'Write Dollar Unit in BDT'),
                                                          onSaved: (val) {
                                                            dollarUnit = val;
                                                          },
                                                          validator: (val) =>
                                                          val!.isEmpty ? 'please enter dollar unit' : null,

                                                        ),
                                                        SizedBox(height: 10),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            RaisedButton(
                                                              color: Colors.redAccent,
                                                              onPressed: () => Navigator.of(context).pop(),
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                            RaisedButton(
                                                              color: Theme
                                                                  .of(context)
                                                                  .primaryColor,
                                                              onPressed: () {
                                                                if (_addKey.currentState!.validate()) {
                                                                  _addKey.currentState!.save();
                                                                  setState(() {
                                                                    paymentProvider.amountModel.dollarUnit = dollarUnit;
                                                                    paymentProvider.amountModel.amountCharge = chargeAmount;
                                                                  });
                                                                  setState(() {
                                                                    _isLoading=true;
                                                                  });
                                                                  paymentProvider.addAmount(
                                                                      paymentProvider.amountModel, context).then((value){
                                                                     setState(() {
                                                                       _isLoading=false;
                                                                     });
                                                                     paymentProvider.getAmount();
                                                                     Navigator.pop(context);
                                                                  });
                                                                }
                                                              },
                                                              child: Text(
                                                                "Update",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text('Update',style: TextStyle(color: Theme.of(context).primaryColor),),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
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
