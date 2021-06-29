import 'package:admin_panel_web/providers/medicine_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/button_widget.dart';
import '../widgets/form_decorate.dart';
import '../widgets/variables.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  bool _isLoading=false;
  String dosage='Tablet';
  String phoneNo='';
  TextEditingController nameText = TextEditingController(text: '');
  TextEditingController strengthText = TextEditingController(text: '');
  TextEditingController genericNameText = TextEditingController(text: '');
  TextEditingController manufacturerText = TextEditingController(text: '');
  TextEditingController priceText = TextEditingController(text: '');
  TextEditingController indicationsText = TextEditingController(text: '');
  TextEditingController adultDoseText = TextEditingController(text: '');
  TextEditingController childDoseText = TextEditingController(text: '');
  TextEditingController renalDoseText = TextEditingController(text: '');
  TextEditingController administrationText = TextEditingController(text: '');
  TextEditingController contradictionText = TextEditingController(text: '');
  TextEditingController sideEffectText = TextEditingController(text: '');
  TextEditingController precautionsText = TextEditingController(text: '');
  TextEditingController pregnancyText = TextEditingController(text: '');
  TextEditingController therapeuticText = TextEditingController(text: '');
  TextEditingController modeOfActionText = TextEditingController(text: '');
  TextEditingController interactionText = TextEditingController(text: '');
  TextEditingController darNoText = TextEditingController(text: '');
  TextEditingController stateText = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkPreferences();
  }
  void _checkPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      phoneNo = preferences.getString('phone')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MedicineProvider provider = Provider.of<MedicineProvider>(context);
    String date = DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch));

    final String id= DateTime.now().millisecondsSinceEpoch.toString();

    final phone= phoneNo;
    Map<String,String> map ={
      'id':id,
      'name':nameText.text,
      'strength':strengthText.text,
      'genericName':genericNameText.text,
      'dosage':dosage,
      'manufacturer':manufacturerText.text,
      'price':priceText.text,
      'date': date,
      'indications':indicationsText.text,
      'adultDose':adultDoseText.text,
      'childDose':childDoseText.text,
      'representativePhone': phone.toString(),
      'renalDose':renalDoseText.text,
      'administration':administrationText.text,
      'contradiction':contradictionText.text,
      'sideEffect':sideEffectText.text,
      'precautions':precautionsText.text,
      'pregnancy':pregnancyText.text,
      'therapeutic':therapeuticText.text,
      'modeOfAction':modeOfActionText.text,
      'interaction':interactionText.text,
      'darNo':darNoText.text,
      'state':'approved',
    };
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height*.9,
      color: Colors.white,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            SizedBox(height: 3),
            _textFormBuilder("Medicine Name",'Renal dose',provider),
            SizedBox(height: 20),
            _textFormBuilder('Generic Name','Administration',provider),
            SizedBox(height: 20),
            _textFormBuilder('Strength in mg/ml','Contradiction',provider),
            SizedBox(height: 20),
            ///Dosage Dropdown...
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 130,),
                Container(
                  height: size.height * .07,
                  width: size.width * .3,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dosage,
                      hint: Text("Select Dosage",
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: 16)),
                      items: Variables.dosageList.map((category) {
                        return DropdownMenuItem(
                          child: Text(category,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 16,
                              )),
                          value: category,
                        );
                      }).toList(),
                      onChanged: (val){
                        setState(() {
                          dosage=val as String;
                        });
                      },
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _textFormBuilder('Manufacturer','Side effect',provider),
            SizedBox(height: 20),
            _textFormBuilder('Price','Precautions & Warnings',provider),
            SizedBox(height: 20),
            _textFormBuilder('Dar. No','Pregnancy & Lactation',provider),
            SizedBox(height: 20),
            _textFormBuilder('Indications','Therapeutic class',provider),
            SizedBox(height: 20),
            _textFormBuilder('Adult dose','Mode of action',provider),
            SizedBox(height: 20),
            _textFormBuilder('Child dose','Interaction',provider),
            SizedBox(height: 20),

            ///Submit Button...

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                _isLoading? spinWave():GradientButton(
                    child: Text('Submit Button'),
                    onPressed: ()async{
                      setState(() {
                        _isLoading=true;
                      });
                      await provider.submitMedicine(map,id,context).then((value){
                        setState(() {
                          _isLoading=false;
                        });
                      });
                    }, borderRadius: 3.0,
                    height: size.height*.05,
                    width: size.width*.2,
                    gradientColors: [
                      Theme.of(context).primaryColor,
                      Colors.teal.shade300
                    ]),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget _textFormBuilder(String hint,String hint1,MedicineProvider provider) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: size.width*.3,
          child: TextFormField(
            textCapitalization: hint=="Medicine Name" || hint=='Generic Name'|| hint=='Manufacturer'? TextCapitalization.words :TextCapitalization.sentences,
            keyboardType: hint == 'Price' ? TextInputType.number :TextInputType.text,
            decoration: FormDecorationWithoutPrefix.copyWith(
                alignLabelWithHint: true,
                labelText: hint, fillColor: Color(0xffF4F7F5),
                hintText: ''
            ),
            maxLines: hint=="Medicine Name" || hint=='Generic Name'|| hint=='Price'
                || hint=='Strength in mg/ml' ||hint=='Dar. No'? 1:4,
            onChanged: (val) {
              setState(() {
                if(hint=="Medicine Name") nameText.text=val;
                if(hint=='Generic Name') genericNameText.text=val;
                if(hint=='Strength in mg/ml') strengthText.text=val;
                if(hint=='Manufacturer') manufacturerText.text=val;
                if(hint=='Price') priceText.text=val;
                if(hint=='Dar. No') darNoText.text=val;
                if(hint=='Indications') indicationsText.text=val;
                if(hint=='Adult dose') adultDoseText.text=val;
                if(hint=='Child dose') childDoseText.text=val;
              });
            },
          ),
        ),
        SizedBox(width: 30),
        Container(
        height: 50,
          width: size.width*.3,
          child: TextFormField(
            textCapitalization: hint1=="Medicine Name" || hint1=='Generic Name'|| hint1=='Manufacturer'? TextCapitalization.words :TextCapitalization.sentences,
            keyboardType: hint1 == 'Price' ? TextInputType.number :TextInputType.text,
            decoration: FormDecorationWithoutPrefix.copyWith(
                alignLabelWithHint: true,
                labelText: hint1, fillColor: Color(0xffF4F7F5),
                hintText: ''
            ),
            maxLines: hint1=="Medicine Name" || hint1=='Generic Name'|| hint1=='Price'
                || hint1=='Strength in mg/ml' ||hint1=='Dar. No'? 1:4,
            onChanged: (val) {
              setState(() {
                if(hint1=='Renal dose') renalDoseText.text=val;
                if(hint1=='Administration') administrationText.text=val;
                if(hint1=='Contradiction') contradictionText.text=val;
                if(hint1=='Side effect') sideEffectText.text=val;
                if(hint1=='Precautions & Warnings') precautionsText.text=val;
                if(hint1=='Pregnancy & Lactation') pregnancyText.text=val;
                if(hint1=='Therapeutic class') therapeuticText.text=val;
                if(hint1=='Mode of action') modeOfActionText.text=val;
                if(hint1=='Interaction') interactionText.text=val;
              });
            },
          ),
        ),
      ],
    );
  }

}
