import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:admin_panel_web/model/aminities_model.dart';
import 'package:admin_panel_web/providers/review_provider.dart';
import 'package:admin_panel_web/widgets/amenities_modal.dart';
import 'package:admin_panel_web/widgets/button_widget.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/form_decoration.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/providers/discount_shop_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:admin_panel_web/widgets/featured_modal.dart';

class DiscountShopDetails extends StatefulWidget {
  @override
  _DiscountShopDetailsState createState() => _DiscountShopDetailsState();
}

class _DiscountShopDetailsState extends State<DiscountShopDetails> {
  static const Color starColor = Color(0xffFFBA00);
  bool _isLoading = false;
  int _counter = 0;
  var file;
  String? name;
  String? error;
  Uint8List? data;
  String? selectedCurrency;
  List<String> shopAmenities = [];
  final _addKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fbController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  void _initializeTextFormData(DiscountShopProvider operation) {
    setState(() => _counter++);
    nameController.text = operation.shopIdList[0].shopName ?? '';
    addressController.text = operation.shopIdList[0].shopAddress ?? '';
    aboutController.text = operation.shopIdList[0].about ?? '';
    emailController.text = operation.shopIdList[0].mailAddress ?? '';
    fbController.text = operation.shopIdList[0].facebookLink ?? '';
    webController.text = operation.shopIdList[0].webAddress ?? '';
    linkedinController.text = operation.shopIdList[0].linkedinLink ?? '';
    phoneController.text = operation.shopIdList[0].phoneNo ?? '';
    twitterController.text = operation.shopIdList[0].twitterLink ?? '';
    discountController.text = operation.shopIdList[0].discount ?? '';
    latController.text = operation.shopIdList[0].latitude ?? '';
    longController.text = operation.shopIdList[0].longitude ?? '';

    operation.shopModel.shopName = operation.shopIdList[0].shopName ?? '';
    operation.shopModel.shopAddress = operation.shopIdList[0].shopAddress ?? '';
    operation.shopModel.about = operation.shopIdList[0].about ?? '';
    operation.shopModel.mailAddress = operation.shopIdList[0].mailAddress ?? '';
    operation.shopModel.facebookLink =
        operation.shopIdList[0].facebookLink ?? '';
    operation.shopModel.webAddress = operation.shopIdList[0].webAddress ?? '';
    operation.shopModel.linkedinLink =
        operation.shopIdList[0].linkedinLink ?? '';
    operation.shopModel.phoneNo = operation.shopIdList[0].phoneNo ?? '';
    operation.shopModel.twitterLink = operation.shopIdList[0].twitterLink ?? '';
    operation.shopModel.discount = operation.shopIdList[0].discount ?? '';
    operation.shopModel.latitude = operation.shopIdList[0].latitude ?? '';
    operation.shopModel.longitude = operation.shopIdList[0].longitude ?? '';
    selectedCurrency = operation.shopIdList[0].currency;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ReviewProvider reviewProvider = Provider.of<ReviewProvider>(context);
    DiscountShopProvider operation =
    Provider.of<DiscountShopProvider>(context);
    if (_counter == 0) _initializeTextFormData(operation);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
        width: publicProvider.pageWidth(size),
        height: size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: _bodyUI(reviewProvider)
    );
  }
  Widget _bodyUI(ReviewProvider reviewProvider) {
    Size size = MediaQuery.of(context).size;
    DiscountShopProvider operation =
    Provider.of<DiscountShopProvider>(context);
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);

    return ListView(
      children: [
        SizedBox(height: 10,),
        //DakterBari Image
        GestureDetector(
          onTap: () =>pickedImage(),
          child: Container(
              margin: EdgeInsets.only(left: 380, right: 380),
              height: size.height*.2,
              width: size.width*.2,
              decoration: BoxDecoration(
                  color: Color(0xffF4F7F5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  file==null? CachedNetworkImage(
                    imageUrl: operation.shopIdList[0].shopImage,
                    placeholder: (context, url) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                    fit: BoxFit.fill,
                  )
                      :Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(
                            data!,
                          ),

                        )
                    ),
                    height: size.height*.2,
                    width: size.width*.3,
                  ),
                ],
              )),
        ),
        SizedBox(height: 20.0),

        //Header Section
        Container(
          width: size.width*.5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextForm('Write Shop name..', operation,publicProvider),
                SizedBox(height: 20),
                _buildTextForm('Write Shop address..', operation,publicProvider),
                SizedBox(height: 20),
                _buildTextForm('Write Latitude..', operation,publicProvider),
                SizedBox(height: 20),
                _buildTextForm('Write Longitude..', operation,publicProvider),
                SizedBox(height: 20),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F7F5),
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  width: size.width*.5,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedCurrency,
                      hint: Text("Change Currency",
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: 16)),
                      items: StaticVariables.currency.map((category) {
                        return DropdownMenuItem(
                          child: Container(
                            width:
                            MediaQuery.of(context).size.width * .2,
                            child: Text(category,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16,
                                )),
                          ),
                          value: category,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCurrency = newValue as String;
                          operation.shopModel.currency = selectedCurrency;
                        });
                      },
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildTextForm('Write Discount..', operation,publicProvider),
              ],
            )),
        SizedBox(height: 20),

        //about
        _aboutBuilder('About', operation,publicProvider),
        SizedBox(height: 20),

        _contactBuilder(operation, 'Contact',publicProvider),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading? spinWave():GradientButton(
                child: Text('Update information'),
                onPressed: ()async{
                  setState(() {
                    _isLoading=true;
                  });
                  if (file != null) {
                    operation.updateDiscountShop(publicProvider.shopModel.id!, operation, file, publicProvider.shopModel.subCategory!).then((value){
                      setState(() {
                        _isLoading=false;
                      });
                    });
                  } else {
                    operation.updateShopDetails(publicProvider.shopModel.id!, operation, publicProvider.shopModel.subCategory!).then((value){
                      setState(() {
                        _isLoading=false;
                      });
                    });
                  }
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
        _amenitiesBuilder(operation,publicProvider),
        SizedBox(height: 20),
        _openingHoursBuilder('Opening Schedule', operation,publicProvider),
        SizedBox(height: 20),

        _featureProductBuilder('Featured Products', publicProvider.shopModel.id!, operation,publicProvider),
        SizedBox(height: 20),
        _ratingSection(reviewProvider),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading? spinWave():GradientButton(
                child: Text('Delete Shop'),
                onPressed: ()async{
                  showDialog(
                    context: context,
                    builder: (context) {
                      Widget okButton = FlatButton(
                        child: Text("YES"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            _isLoading=true;
                          });
                          operation.deleteShop(publicProvider.shopModel.id!,publicProvider.shopModel.subCategory!,operation).then((value){
                            setState(() {
                              _isLoading=false;
                            });
                          });
                        },
                      );
                      Widget noButton = FlatButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title:
                        Text("Are you sure you want to delete this Shop?"),
                        content: Text("This shop will be deleted"),
                        actions: [noButton, okButton],
                      );
                      return alert;
                    },
                  );
                }, borderRadius: 3.0,
                height: size.height*.05,
                width: size.width*.2,
                gradientColors: [
                  Colors.red,
                  Colors.redAccent
                ]),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
    //});
  }
  pickedImage() async {
    html.FileUploadInputElement input = html.FileUploadInputElement()
      ..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      file = input.files!.first;
      final reader1 =   html.FileReader();
      reader1.readAsDataUrl(input.files![0]);
      reader1.onError.listen((err) => setState((){
        error = err.toString();
      }) );
      reader1.onLoad.first.then((res){
        final encoded = reader1.result as String;
        final stripped = encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
        setState(() {
          name = input.files![0].name;
          data  =base64.decode(stripped);
          error = null;
        });
      });
    });
  }

  Widget _headingBuilder(String heading) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Color(0xffF4F7F5), borderRadius: BorderRadius.circular(5)),
      child: Text(
        heading,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

  Widget _ratingSection(ReviewProvider reviewProvider) {
    Size size = MediaQuery.of(context).size;

    Map<String, double> dataMap = {
      "⭐": double.parse(reviewProvider.shopOneStar.toString()),
      "⭐⭐": double.parse(reviewProvider.shopTwoStar.toString()),
      "⭐⭐⭐": double.parse(reviewProvider.shopThreeStar.toString()),
      "⭐⭐⭐⭐": double.parse(reviewProvider.shopFourStar.toString()),
      "⭐⭐⭐⭐⭐": double.parse(reviewProvider.shopFiveStar.toString()),
    };
    final List<Color> colorList = [
      Color(0xffFF5C6B),
      Color(0xffDBB049),
      Color(0xff7A5AB5),
      Color(0xff00D099),
      Color(0xff0094D4),
    ];

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.topLeft,
      color: Colors.white,
      width: size.width*.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Ratings Overview",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Container(
            width: size.width*.25,
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 2500),
              chartLegendSpacing: 35,
              chartRadius: MediaQuery.of(context).size.width * .4,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              centerText: "Ratings",
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[900]),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 0,
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total People Rated",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: size.width * .018,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: size.width * .08),
                        Text(
                          "Avg. Ratings: ",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: size.width * .018,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "${reviewProvider.avgShopRating}",
                              style: TextStyle(
                                  fontSize: size.width * .018,
                                  fontWeight: FontWeight.w500,
                                  color: starColor),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.star,
                              size: size.width * .02,
                              color: starColor,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.assignment_ind,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${reviewProvider.allShopReviewList.length}',
                          style: TextStyle(
                              fontSize: size.width * .03,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800]),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _aboutBuilder(String about, DiscountShopProvider operation,PublicProvider publicProvider) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          _headingBuilder(about),
          SizedBox(height: 10),

          Container(
            width: size.width*.5,
            child: TextFormField(
              maxLines:  4 ,
              readOnly: false,
              controller: aboutController,
              initialValue: null,
              decoration: FormDecoration.copyWith(
                  alignLabelWithHint: true,
                  labelText: 'Write About..',
                  fillColor: Color(0xffF4F7F5)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  operation.shopModel.about = aboutController.text;
                });
              },
            ),
          ),
          //operation.shopIdList[0].about,
        ],
      ),
    );
  }

  Widget _contactBuilder(DiscountShopProvider operation, String contact,PublicProvider publicProvider) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _headingBuilder(contact),
          SizedBox(height: 20),
          _buildTextForm('Email Address', operation,publicProvider),
          SizedBox(height: 20),
          _buildTextForm('Facebook address', operation,publicProvider),
          SizedBox(height: 20),
          _buildTextForm('Web address', operation,publicProvider),
          SizedBox(height: 20),
          _buildTextForm('Linkedin link', operation,publicProvider),
          SizedBox(height: 20),
          _buildTextForm('Phone number', operation,publicProvider),
          SizedBox(height: 20),
          _buildTextForm('Twitter link', operation,publicProvider),
        ],
      ),
    );
  }

  Widget _buildTextForm(String hint, DiscountShopProvider operation,PublicProvider publicProvider) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width*.5,
      child: TextFormField(
        readOnly: hint == 'Phone number' ? true : false,
        controller: hint == 'Write Shop name..'
            ? nameController
            : hint == 'Write Shop address..'
            ? addressController
            : hint == 'Email Address'
            ? emailController
            : hint == 'Facebook address'
            ? fbController
            : hint == 'Web address'
            ? webController
            : hint == 'Linkedin link'
            ? linkedinController
            : hint == 'Write Discount..'
            ? discountController
            : hint == 'Phone number'
            ? phoneController
            : hint == 'Write Latitude..'
            ? latController
            : hint == 'Write Longitude..'
            ? longController
            : twitterController,
        initialValue: null,
        decoration: FormDecoration.copyWith(
            alignLabelWithHint: true,
            labelText: hint,
            fillColor: Color(0xffF4F7F5)),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          if (hint == 'Write Shop name..')
            operation.shopModel.shopName = nameController.text;
          if (hint == 'Write Shop address..')
            operation.shopModel.shopAddress = addressController.text;
          if (hint == 'Email address')
            operation.shopModel.mailAddress = emailController.text;
          if (hint == 'Facebook address')
            operation.shopModel.facebookLink = fbController.text;
          if (hint == 'Web address')
            operation.shopModel.webAddress = webController.text;
          if (hint == 'Linkedin link')
            operation.shopModel.linkedinLink = linkedinController.text;
          if (hint == 'Write Discount..')
            operation.shopModel.discount = discountController.text;
          if (hint == 'Phone number')
            operation.shopModel.phoneNo = phoneController.text;
          if (hint == 'Write Latitude..')
            operation.shopModel.latitude = latController.text;
          if (hint == 'Write Longitude..')
            operation.shopModel.longitude = longController.text;
          if (hint == 'Twitter link')
            operation.shopModel.twitterLink = twitterController.text;
        },
      ),
    );
  }

  Widget _amenitiesBuilder(
      DiscountShopProvider operation,PublicProvider publicProvider) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Color(0xffF4F7F5),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5),
                Text('Amenities:',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    _showDialog(operation,publicProvider);
                  },
                  child: outlineIconButton(context, Icons.add, 'Add Amenities',
                      Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: size.width*.5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: operation.shopIdList[0].amenities.length > 2
                  ? 2
                  : operation.shopIdList[0].amenities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(operation.shopIdList[0].amenities[index].toString()),
                        GestureDetector(
                            onTap: () {
                              showToast('Please wait..');
                              setState(() {
                                shopAmenities.clear();
                                operation.shopModel.amenities = null;
                                shopAmenities.add(operation
                                    .shopIdList[0].amenities[index]
                                    .toString());
                                operation.shopModel.amenities = shopAmenities;
                                operation.removeAmenities(publicProvider.shopModel.id!,operation);
                                //auth.shopModel.amenities = null;
                              });
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          operation.shopIdList[0].amenities.length > 2
              ? Container(
            width: MediaQuery.of(context).size.width*.5,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => ViewAllAmenities(context, operation, publicProvider.shopModel.id!),
              child: Text(
                "View all amenities",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
              : Container(),
        ],
      ),
    );
  }

  Widget _openingHoursBuilder(
      String heading, DiscountShopProvider operation,PublicProvider publicProvider) {
    Size size = MediaQuery.of(context).size;
    final String sat = operation.shopIdList[0].sat == null
        ? ''
        : '  Saturday: ${operation.shopIdList[0].sat[0]}-${operation.shopIdList[0].sat[1]}';
    final String sun = operation.shopIdList[0].sun == null
        ? ''
        : '  Sunday: ${operation.shopIdList[0].sun[0]}-${operation.shopIdList[0].sun[1]}';
    final String mon = operation.shopIdList[0].mon == null
        ? ''
        : '  Monday: ${operation.shopIdList[0].mon[0]}-${operation.shopIdList[0].mon[1]}';
    final String tue = operation.shopIdList[0].tue == null
        ? ''
        : '  Tuesday: ${operation.shopIdList[0].tue[0]}-${operation.shopIdList[0].tue[1]}';
    final String wed = operation.shopIdList[0].wed == null
        ? ''
        : '  Wednesday: ${operation.shopIdList[0].wed[0]}-${operation.shopIdList[0].wed[1]}';
    final String thu = operation.shopIdList[0].thu == null
        ? ''
        : '  Thursday: ${operation.shopIdList[0].thu[0]}-${operation.shopIdList[0].thu[1]}';
    final String fri = operation.shopIdList[0].fri == null
        ? ''
        : '  Friday: ${operation.shopIdList[0].fri[0]}-${operation.shopIdList[0].fri[1]}';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _headingBuilder(heading),
          SizedBox(height: 15),
          Container(
            width: size.width*.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(sat, style: TextStyle(fontSize: 18)),
                Text(sun, style: TextStyle(fontSize: 18)),
                Text(mon, style: TextStyle(fontSize: 18)),
                Text(tue, style: TextStyle(fontSize: 18)),
                Text(wed, style: TextStyle(fontSize: 18)),
                Text(thu, style: TextStyle(fontSize: 18)),
                Text(fri, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading? spinWave():GradientButton(
                  child: Text('Update Schedule'),
                  onPressed: ()async{
                    publicProvider.category=publicProvider.subCategory;
                    publicProvider.subCategory='Update Schedule';
                    setState(() {
                      publicProvider.shopModel.id=operation.shopIdList[0].id;
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
        ],
      ),
    );
  }

  Widget _featureProductBuilder(
      String heading, String id, DiscountShopProvider operation,PublicProvider publicProvider) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xffF4F7F5),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Color(0xffF4F7F5),
                borderRadius: BorderRadius.circular(5)),
            child: Text('Featured Products',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          SizedBox(height: 15),
          ListView.builder(
            itemCount: operation.productList.length > 2
                ? 2
                : operation.productList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FeatureProductTile(
                id: operation.productList[index].id,
                shopId: operation.productList[index].shopId,
                productName: operation.productList[index].productName,
                productPrice: operation.productList[index].productPrice,
                productImage: operation.productList[index].imageUrl,
              );
            },
          ),
          operation.productList.length > 2
              ? Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => ViewFeaturedProducts(context),
              child: Text(
                "View all products",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
              : Container(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading? spinWave():GradientButton(
                  child: Text('Add Featured Products'),
                  onPressed: ()async{
                    publicProvider.category=publicProvider.subCategory;
                    publicProvider.subCategory='Add Featured Product';
                    setState(() {
                      publicProvider.featuredProductModel.id=id;
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
        ],
      ),
    );
  }

  _showDialog(DiscountShopProvider operation,PublicProvider publicProvider) {
    String? name;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            contentPadding: EdgeInsets.all(20),
            title: Text(
              "Add Amenities",
              textAlign: TextAlign.center,
            ),
            content: Container(
              child: Form(
                key: _addKey,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: 'Write amenities'),
                      onSaved: (val) {
                        name = val!;
                      },
                      validator: (val) =>
                      val!.isEmpty ? 'please write amenities' : null,
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
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            showToast('Please wait..');
                            if (_addKey.currentState!.validate()) {
                              _addKey.currentState!.save();
                              AmenitiesModel ap = AmenitiesModel();
                              ap.amenitiesName = name;
                              setState(() {
                                shopAmenities.clear();
                                shopAmenities.add(name!);
                                operation.shopModel.amenities = null;
                                operation.shopModel.amenities = shopAmenities;
                                operation.updateAmenities(operation, publicProvider.shopModel.id!);
                              });
                              //Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            "Add",
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
  }
}

//ignore: must_be_immutable
class FeatureProductTile extends StatelessWidget {
  String? id, shopId,productImage, productName, productPrice;

  FeatureProductTile(
      {this.id, this.productImage, this.productName, this.productPrice,this.shopId});

  @override
  Widget build(BuildContext context) {
    DiscountShopProvider operation =
    Provider.of<DiscountShopProvider>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
        leading: CachedNetworkImage(
          width: size.width * .20,
          imageUrl: productImage!,
          placeholder: (context, url) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.fill,
        ),
        title: Text("ProductName: " + productName!),
        subtitle: Text("ProductPrice: " + productPrice!),
        trailing: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  Widget okButton = FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      showToast('Please wait..');
                      operation.deleteFeaturedProduct(id!,shopId!,operation);
                      //Navigator.pop(context);
                    },
                  );
                  Widget noButton = FlatButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title:
                    Text("Are you sure you want to delete this Product?"),
                    content: Text("This product will be deleted"),
                    actions: [noButton, okButton],
                  );
                  return alert;
                },
              );
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            )));
  }
}

