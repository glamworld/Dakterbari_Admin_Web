import 'package:admin_panel_web/providers/discount_shop_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateSchedule extends StatefulWidget {
  String? id;

  UpdateSchedule({this.id});
  @override
  _UpdateScheduleState createState() => _UpdateScheduleState();
}

class _UpdateScheduleState extends State<UpdateSchedule> {
  bool _isLoading=false;
  int _counter=0;

  void _initializeSchedule(DiscountShopProvider auth){
    setState(()=>_counter++);
    auth.shopModel.sat=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.shopModel.sun=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.shopModel.mon=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.shopModel.tue=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.shopModel.wed=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.shopModel.thu=[false,TimeOfDay.now(),TimeOfDay.now()];
    auth.shopModel.fri=[false,TimeOfDay.now(),TimeOfDay.now()];
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DiscountShopProvider auth = Provider.of<DiscountShopProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    if(_counter==0) _initializeSchedule(auth);
    return Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: _bodyUI(auth,publicProvider)
    );
  }
  Widget _bodyUI(DiscountShopProvider auth,PublicProvider publicProvider) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       SizedBox(height: 10,),
      _headingBuilder("Choose day and time schedule"),
      SizedBox(height: size.width / 24),

      _availability('Sat', auth),
      _availability('Sun', auth),
      _availability('Mon', auth),
      _availability('Tue', auth),
      _availability('Wed', auth),
      _availability('Thu', auth),
      _availability('Fri', auth),
      SizedBox(height: 20,),
      _bottomNavigation(auth,publicProvider)
      ]
    ),
    );
  }
  Widget _headingBuilder(String heading){
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      child: Text(heading,style: TextStyle(
          fontSize: size.width*.018,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor),),
    );
  }
  Widget _bottomNavigation(DiscountShopProvider auth,PublicProvider publicProvider) {
    Size size = MediaQuery.of(context).size;
    return _isLoading? spinWave():GradientButton(
        child: Text('Update'),
        onPressed: (){
          _updateSchedule(auth, publicProvider);

        }, borderRadius: 3.0,
        height: size.height*.05,
        width: size.width*.2,
        gradientColors: [
          Theme.of(context).primaryColor,
          Colors.teal.shade300
        ]);
  }

  Widget _availability(String day,DiscountShopProvider auth){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*.5,
      //padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Day Check Button
          Row(
            children: [
              Checkbox(
                value: day=='Sat'?auth.shopModel.sat![0]:day=='Sun'?auth.shopModel.sun![0]:day=='Mon'?auth.shopModel.mon![0]:
                day=='Tue'?auth.shopModel.tue![0]:day=='Wed'?auth.shopModel.wed![0]:day=='Thu'?auth.shopModel.thu![0]:
                auth.shopModel.fri![0],
                onChanged: (bool? checkedValue) {
                  setState(() =>
                  day=='Sat'?auth.shopModel.sat![0] = checkedValue:
                  day=='Sun'?auth.shopModel.sun![0]= checkedValue:
                  day=='Mon'?auth.shopModel.mon![0]= checkedValue:
                  day=='Tue'?auth.shopModel.tue![0]= checkedValue:
                  day=='Wed'?auth.shopModel.wed![0]= checkedValue:
                  day=='Thu'?auth.shopModel.thu![0]= checkedValue:
                  auth.shopModel.fri![0]= checkedValue);
                },
              ),
              Text(
                day,
                style: TextStyle(
                    fontSize: size.width*.012,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800]),
              )
            ],
          ),
          //Time Button
          Row(
            children: [
              FlatButton(
                onPressed: (){
                  _selectTime(context, 'from', day,auth);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Row(
                    children: [
                      Text(day=="Sat"?'${auth.shopModel.sat![1].hour}:${auth.shopModel.sat![1].minute}':
                      day=="Sun"?'${auth.shopModel.sun![1].hour}:${auth.shopModel.sun![1].minute}':
                      day=="Mon"?'${auth.shopModel.mon![1].hour}:${auth.shopModel.mon![1].minute}':
                      day=="Tue"?'${auth.shopModel.tue![1].hour}:${auth.shopModel.tue![1].minute}':
                      day=="Wed"?'${auth.shopModel.wed![1].hour}:${auth.shopModel.wed![1].minute}':
                      day=="Thu"?'${auth.shopModel.thu![1].hour}:${auth.shopModel.thu![1].minute}':
                      '${auth.shopModel.fri![1].hour}:${auth.shopModel.fri![1].minute}',
                        style: TextStyle(fontSize: size.width*.012,),),

                      Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).primaryColor)
                    ],
                  ),
                ),
              ),
              Text("to",style: TextStyle(fontSize: size.width*.012),),
              FlatButton(
                onPressed: (){
                  _selectTime(context, 'to', day, auth);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Row(
                    children: [
                      Text(day=="Sat"?'${auth.shopModel.sat![2].hour}:${auth.shopModel.sat![2].minute}':
                      day=="Sun"?'${auth.shopModel.sun![2].hour}:${auth.shopModel.sun![2].minute}':
                      day=="Mon"?'${auth.shopModel.mon![2].hour}:${auth.shopModel.mon![2].minute}':
                      day=="Tue"?'${auth.shopModel.tue![2].hour}:${auth.shopModel.tue![2].minute}':
                      day=="Wed"?'${auth.shopModel.wed![2].hour}:${auth.shopModel.wed![2].minute}':
                      day=="Thu"?'${auth.shopModel.thu![2].hour}:${auth.shopModel.thu![2].minute}':
                      '${auth.shopModel.fri![2].hour}:${auth.shopModel.fri![2].minute}',
                        style: TextStyle(fontSize: size.width*.012)),

                      Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).primaryColor)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, String identifier,String day,DiscountShopProvider auth) async{
    if(identifier=="from"){
      switch(day){
        case 'Sat':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.sat![1],
          ))!;
          if(picked!=auth.shopModel.sat![1]){
            setState(() =>auth.shopModel.sat![1] = picked);
          }
          break;
        case 'Sun':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.sun![1],
          ))!;
          if(picked!=auth.shopModel.sun![1]){
            setState(() =>auth.shopModel.sun![1] = picked);
          }
          break;
        case 'Mon':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.mon![1],
          ))!;
          if(picked!=auth.shopModel.mon![1]){
            setState(() =>auth.shopModel.mon![1] = picked);
          }
          break;
        case 'Tue':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.tue![1],
          ))!;
          if(picked!=auth.shopModel.tue![1]){
            setState(() =>auth.shopModel.tue![1] = picked);
          }
          break;
        case 'Wed':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.wed![1],
          ))!;
          if(picked!=auth.shopModel.wed![1]){
            setState(() =>auth.shopModel.wed![1] = picked);
          }
          break;
        case 'Thu':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.thu![1],
          ))!;
          if(picked!=auth.shopModel.thu![1]){
            setState(() =>auth.shopModel.thu![1] = picked);
          }
          break;
        default:
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.fri![1],
          ))!;
          if(picked!=auth.shopModel.fri![1]){
            setState(() =>auth.shopModel.fri![1] = picked);
          }
          break;

      }
    }else{
      switch(day){
        case 'Sat':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.sat![2],
          ))!;
          if(picked!=auth.shopModel.sat![2]){
            setState(() =>auth.shopModel.sat![2] = picked);
          }
          break;
        case 'Sun':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.sun![2],
          ))!;
          if(picked!=auth.shopModel.sun![2]){
            setState(() =>auth.shopModel.sun![2] = picked);
          }
          break;
        case 'Mon':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.mon![2],
          ))!;
          if(picked!=auth.shopModel.mon![2]){
            setState(() =>auth.shopModel.mon![2] = picked);
          }
          break;
        case 'Tue':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.tue![2],
          ))!;
          if(picked!=auth.shopModel.tue![2]){
            setState(() =>auth.shopModel.tue![2] = picked);
          }
          break;
        case 'Wed':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.wed![2],
          ))!;
          if(picked!=auth.shopModel.wed![2]){
            setState(() =>auth.shopModel.wed![2] = picked);
          }
          break;
        case 'Thu':
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.thu![2],
          ))!;
          if(picked!=auth.shopModel.thu![2]){
            setState(() =>auth.shopModel.thu![2] = picked);
          }
          break;
        default:
          final TimeOfDay picked = (await showTimePicker(
            context: context,
            initialTime: auth.shopModel.fri![2],
          ))!;
          if(picked!=auth.shopModel.fri![2]){
            setState(() =>auth.shopModel.fri![2] = picked);
          }
          break;

      }
    }
  }

  Future<void> _updateSchedule(DiscountShopProvider operation,PublicProvider publicProvider)async{
    setState(() {
      _isLoading=true;
    });
     await operation.updateSchedule(operation,publicProvider.shopModel.id!).then((value){
       setState(() {
         _isLoading=true;
       });
     });

  }

}
