import 'package:admin_panel_web/providers/medicine_provider.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/decorate.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateMedicine extends StatefulWidget {
  @override
  _UpdateMedicineState createState() => _UpdateMedicineState();
}

class _UpdateMedicineState extends State<UpdateMedicine> {
  bool _isLoading=false;
  int _counter = 0;
  String dosage='';
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

  void _initializeTextFormData(PublicProvider publicProvider){
    setState(() => _counter++);
    nameText = TextEditingController(text: publicProvider.medicineModel.name);
    strengthText = TextEditingController(text: publicProvider.medicineModel.strength);
    genericNameText = TextEditingController(text:publicProvider.medicineModel.genericName);
    manufacturerText = TextEditingController(text: publicProvider.medicineModel.manufacturer);
    priceText = TextEditingController(text: publicProvider.medicineModel.price);
    indicationsText = TextEditingController(text: publicProvider.medicineModel.indications);
    adultDoseText = TextEditingController(text: publicProvider.medicineModel.adultDose);
    childDoseText = TextEditingController(text: publicProvider.medicineModel.childDose);
    renalDoseText = TextEditingController(text: publicProvider.medicineModel.renalDose);
    administrationText = TextEditingController(text: publicProvider.medicineModel.administration);
    contradictionText = TextEditingController(text: publicProvider.medicineModel.contradiction);
    sideEffectText = TextEditingController(text: publicProvider.medicineModel.sideEffect);
    precautionsText = TextEditingController(text: publicProvider.medicineModel.precautions);
    pregnancyText = TextEditingController(text: publicProvider.medicineModel.pregnancy);
    therapeuticText = TextEditingController(text: publicProvider.medicineModel.therapeutic);
    modeOfActionText = TextEditingController(text: publicProvider.medicineModel.modeOfAction);
    interactionText = TextEditingController(text: publicProvider.medicineModel.interaction);
    darNoText = TextEditingController(text: publicProvider.medicineModel.darNo);
    stateText = TextEditingController(text: publicProvider.medicineModel.state);
    dosage=publicProvider.medicineModel.dosage!;
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final MedicineProvider provider = Provider.of<MedicineProvider>(context);
    if (_counter == 0) _initializeTextFormData(publicProvider);

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
            _textFormBuilder("Medicine Name",'Renal dose',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Generic Name','Administration',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Strength in mg/ml','Contradiction',publicProvider),
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
                          publicProvider.medicineModel.dosage=dosage;
                        });
                      },
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _textFormBuilder('Manufacturer','Side effect',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Price','Precautions & Warnings',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Dar. No','Pregnancy & Lactation',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Indications','Therapeutic class',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Adult dose','Mode of action',publicProvider),
            SizedBox(height: 20),
            _textFormBuilder('Child dose','Interaction',publicProvider),
            SizedBox(height: 20),

            ///Submit Button...

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                _isLoading? spinWave():GradientButton(
                    child: Text('Update'),
                    onPressed: ()async{
                      setState(() {
                        _isLoading=true;
                      });
                      await provider.updateMedicine(publicProvider).then((value){
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
  Widget _textFormBuilder(String hint,String hint1,PublicProvider provider) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: size.width*.3,
          child: TextFormField(
            controller: hint=="Medicine Name"?nameText:hint=='Generic Name'?genericNameText
            :hint=='Strength in mg/ml'?strengthText:hint=='Manufacturer'?manufacturerText
            :hint=='Price'?priceText:hint=='Dar. No'?darNoText:hint=='Indications'?indicationsText
            :hint=='Adult dose'?adultDoseText:hint=='Child dose'?childDoseText:null,
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
                if (hint == 'Medicine Name')
                  provider.medicineModel.name = nameText.text;
                if (hint == 'Generic Name')
                  provider.medicineModel.genericName = genericNameText.text;
                if (hint == 'Strength in mg/ml')
                  provider.medicineModel.genericName = strengthText.text;
                if (hint == 'Manufacturer')
                  provider.medicineModel.genericName = manufacturerText.text;
                if (hint == 'Price')
                  provider.medicineModel.genericName = priceText.text;
                if (hint == 'Dar. No')
                  provider.medicineModel.genericName = darNoText.text;
                if (hint == 'Indications')
                  provider.medicineModel.genericName = indicationsText.text;
                if (hint == 'Adult dose')
                  provider.medicineModel.genericName = adultDoseText.text;
                if (hint == 'Child dose')
                  provider.medicineModel.genericName = childDoseText.text;
              });
            },
          ),
        ),
        SizedBox(width: 30),
        Container(
          height: 50,
          width: size.width*.3,
          child: TextFormField(
            controller: hint1=='Renal dose'?renalDoseText:hint1=='Administration'?administrationText
            :hint1=='Contradiction'?contradictionText:hint1=='Side effect'?sideEffectText
            :hint1=='Precautions & Warnings'?precautionsText:hint1=='Pregnancy & Lactation'?pregnancyText
            :hint1=='Therapeutic class'?therapeuticText:hint1=='Mode of action'?modeOfActionText
            :hint1=='Interaction'?interactionText:null,
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
                if (hint1 == 'Renal dose')
                  provider.medicineModel.renalDose = renalDoseText.text;
                if (hint1 == 'Administration')
                  provider.medicineModel.administration = administrationText.text;
                if (hint1 == 'Contradiction')
                  provider.medicineModel.contradiction = contradictionText.text;
                if (hint1 == 'Side effect')
                  provider.medicineModel.sideEffect = sideEffectText.text;
                if (hint1 == 'Precautions & Warnings')
                  provider.medicineModel.precautions = precautionsText.text;
                if (hint1 == 'Pregnancy & Lactation')
                  provider.medicineModel.pregnancy = pregnancyText.text;
                if (hint1 == 'Therapeutic class')
                  provider.medicineModel.therapeutic = therapeuticText.text;
                if (hint1 == 'Mode of action')
                  provider.medicineModel.modeOfAction = modeOfActionText.text;
                if (hint1 == 'Interaction')
                  provider.medicineModel.interaction = interactionText.text;
              });
            },
          ),
        ),
      ],
    );
  }

}
