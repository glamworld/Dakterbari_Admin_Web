import 'package:admin_panel_web/providers/public_provider.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/widgets/form_decoration.dart';
import 'package:admin_panel_web/widgets/static_variable_page.dart';
import 'package:admin_panel_web/providers/discount_shop_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:admin_panel_web/providers/review_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllDiscountShopPage extends StatefulWidget {

  @override
  _AllDiscountShopPageState createState() => _AllDiscountShopPageState();
}

class _AllDiscountShopPageState extends State<AllDiscountShopPage> {
  int _index =0;
  String? hospitalLabPharmacy;
  String? travelTour;
  String? hotelRestaurant;
  String? educationTraining;
  String? entertainment;
  String? weddingParlor;
  String? familyNeeds;
  String? demandService;
  String? equipmentTools;
  String? hireRent;
  String? automobiles;
  String? realState;
  String? miscellaneous;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    final DiscountShopProvider provider = Provider.of<DiscountShopProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      height: size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        height: size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 700,
                width: size.width*.6,
                //color: Colors.grey,
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: _index==0?provider.allShopList.length:provider.shopList.length,
                    itemBuilder: (context, index) {
                      var dta = _index==0?provider.allShopList[index]:provider.shopList[index];
                      return DiscountShopTile(
                        id: dta.id,
                        name: dta.shopName,
                        about: dta.about,
                        subCategory: dta.subCategory,
                        location: dta.shopAddress,
                        urlImage: dta.shopImage,
                        executivePhone: dta.executivePhoneNo,
                        review: dta.avgReviewStar,
                      );
                    })
            ),
            VerticalDivider(color: Colors.grey.shade800,width: 1,),
            Expanded(
              child: Container(
              // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView(
              children: [
              SizedBox(height: 10),
              _dropDownBuilder('Hospital/Lab/Pharmacy'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Travel & Tour'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Hotel & Restaurant'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Education & Training'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Entertainment'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Wedding & Parlor'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Family Needs'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Demand Service'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Equipment & Tools'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Hire & Rent'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Automobiles'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Real State'),
              SizedBox(height: size.width / 50),
              _dropDownBuilder('Miscellaneous'),
              SizedBox(height: size.width / 50),
              ]
              )
              ),
            ),
          ],
        ),
      )
    );
  }
  Widget _dropDownBuilder(String hint){
    Size size=MediaQuery.of(context).size;
    DiscountShopProvider operation = Provider.of<DiscountShopProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,),
      decoration: BoxDecoration(
        color: Colors.white, //Color(0xffF4F7F5),
      ),
      //width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: cardDecoration,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: hint=="Hospital/Lab/Pharmacy"? hospitalLabPharmacy
                : hint=="Travel & Tour"? travelTour
                : hint=="Hotel & Restaurant"? hotelRestaurant
                : hint=="Education & Training"? educationTraining
                : hint=="Entertainment"? entertainment
                : hint=="Wedding & Parlor"? weddingParlor
                : hint=="Family Needs"? familyNeeds
                : hint=="Demand Service"? demandService
                : hint=="Equipment & Tools"? equipmentTools
                : hint=="Hire & Rent"? hireRent
                : hint=="Automobiles"? automobiles
                : hint=="Real State"? realState
                :miscellaneous,
            hint: Text(hint,style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16)),
            items: hint=='Hospital/Lab/Pharmacy'?
            StaticVariables.hlpSubCategory.map((hospitalLabPharmacy){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(hospitalLabPharmacy,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: hospitalLabPharmacy,
              );
            }).toList()
                :hint=='Travel & Tour'?
            StaticVariables.tourSubCategory.map((travelTour){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(travelTour,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: travelTour,
              );
            }).toList()
            //for service category
                :hint=='Hotel & Restaurant'?
            StaticVariables.hotelSubCategory.map((hotelRestaurant){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(hotelRestaurant,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: hotelRestaurant,
              );
            }).toList()
            //for service category
                :hint=='Education & Training'?
            StaticVariables.educationSubCategory.map((educationTraining){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(educationTraining,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: educationTraining,
              );
            }).toList()
            //for service category
                :hint=='Entertainment'?
            StaticVariables.entertainSubCategory.map((entertainment){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(entertainment,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: entertainment,
              );
            }).toList()
            //for service category
                :hint=='Wedding & Parlor'?
            StaticVariables.weddingSubCategory.map((weddingParlor){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(weddingParlor,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: weddingParlor,
              );
            }).toList()
            //for service category
                :hint=='Family Needs'?
            StaticVariables.familySubCategory.map((familyNeeds){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(familyNeeds,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: familyNeeds,
              );
            }).toList()
            //for service category
                :hint=='Demand Service'?
            StaticVariables.demandSubCategory.map((demandService){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(demandService,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: demandService,
              );
            }).toList()
            //for service category
                :hint=='Equipment & Tools'?
            StaticVariables.equipmentSubCategory.map((equipmentTools){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(equipmentTools,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: equipmentTools,
              );
            }).toList()
            //for service category
                :hint=='Hire & Rent'?
            StaticVariables.hireSubCategory.map((hireRent){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(hireRent,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: hireRent,
              );
            }).toList()
            //for service category
                :hint=='Automobiles'?
            StaticVariables.autoMobileSubCategory.map((automobiles){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(automobiles,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: automobiles,
              );
            }).toList()
            //for service category
                :hint=='Real State'?
            StaticVariables.realStateSubCategory.map((realState){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(realState,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: realState,
              );
            }).toList()
            //for service category
                :StaticVariables.miscellaneousSubCategory.map((miscellaneous){
              return DropdownMenuItem(
                child: Container(
                  width: size.width*.1,
                  child: Text(miscellaneous,style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,)),
                ),
                value: miscellaneous,
              );
            }).toList(),
            onChanged: (newValue)async{
              setState(() {
                hint=="Hospital/Lab/Pharmacy"? hospitalLabPharmacy = newValue as String
                    :hint=="Travel & Tour"? travelTour = newValue as String
                    :hint=="Hotel & Restaurant"? hotelRestaurant = newValue as String
                    :hint=="Education & Training"? educationTraining = newValue as String
                    :hint=="Entertainment"? entertainment = newValue as String
                    :hint=="Wedding & Parlor"? weddingParlor = newValue as String
                    :hint=="Family Needs"? familyNeeds = newValue as String
                    :hint=="Demand Service"? demandService = newValue as String
                    :hint=="Equipment & Tools"? equipmentTools = newValue as String
                    :hint=="Hire & Rent"? hireRent = newValue as String
                    :hint=="Automobiles"? automobiles = newValue as String
                    :hint=="Real State"? realState = newValue as String
                    :miscellaneous = newValue as String;
              });
              await operation.getShop(newValue as String).then((value)async{
                setState(() {
                  _index++;
                });
              },onError: (error){
                showToast(error.toString());
              });
            },
            dropdownColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DiscountShopTile extends StatefulWidget {
  String? id,name, about,subCategory, review,executivePhone,location, urlImage;

  DiscountShopTile(
      {
        this.id,
        this.about,
        this.name,
        this.subCategory,
        this.review,
        this.location,
        this.executivePhone,
        this.urlImage});
  @override
  _DiscountShopTileState createState() => _DiscountShopTileState();
}

class _DiscountShopTileState extends State<DiscountShopTile> {
  static const Color starColor = Color(0xffFFBA00);

  @override
  Widget build(BuildContext context) {
    DiscountShopProvider operation = Provider.of<DiscountShopProvider>(context);
    PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    ReviewProvider reviewProvider = Provider.of<ReviewProvider>(context);
    return GestureDetector(
      onTap: ()async{
        await operation.getShopId(widget.id!).then((value)async{
          await reviewProvider.getAllShopReview(widget.id!).then((value)async{
            await operation.getFeaturedProduct(widget.id!).then((value){
              reviewProvider.getShopOneStar();
              publicProvider.category=publicProvider.subCategory;
              publicProvider.subCategory='Discount Shop Details';
              setState(() {
                publicProvider.shopModel.id=widget.id;
                publicProvider.shopModel.subCategory=widget.subCategory;
              });
            });

          },onError: (error){
            showToast(error.toString());
          });
        });

      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 10),
        decoration: BoxDecoration(
          color: Color(0xffF4F7F5),
          border: Border.all(
              color: Theme.of(context).primaryColor
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image Container
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, offset: Offset(0, 1), blurRadius: 2)
                    ]),
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: widget.urlImage!,
                  placeholder: (context, url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/loadingimage.gif',height: 90, width: 200,fit: BoxFit.fitHeight,),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                  height: MediaQuery.of(context).size.width*.1,
                  fit: BoxFit.fill,
                ),),
            ),
            //Content Container
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.width*.095,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Shop Name
                    Expanded(
                      child: Text(
                        widget.name!,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 2),
                    //Shop Location
                    Expanded(
                      child: Text(
                        widget.location!,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 10),
                    //Shop About
                    Expanded(
                      child: Text(widget.about!,maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 15,)
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Text(widget.executivePhone!,
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 15,)
                      ),
                    ),
                    SizedBox(height: 10),

                    Divider(color: Theme.of(context).primaryColor,),
                    //Footer Section
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                            decoration:BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Text("Open",style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            ),),
                          ),

                          //Rating Section
                          Row(
                            children: [
                              Text(
                                "Ratings:",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 5),
                              widget.review == '5.0'
                                  ? Row(
                                children: [
                                  Icon(Icons.star, size: 15, color: starColor),
                                  Icon(Icons.star, size: 15, color: starColor),
                                  Icon(Icons.star, size: 15, color: starColor),
                                  Icon(Icons.star, size: 15, color: starColor),
                                  Icon(Icons.star, size: 15, color: starColor),
                                ],
                              )
                                  : widget.review == '4.0'
                                  ? Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              )
                                  : widget.review == '4.5'
                                  ? Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              )
                                  : widget.review == '3.0'
                                  ? Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              )
                                  : widget.review == '3.5'
                                  ? Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              )
                                  : widget.review == '2.0'
                                  ? Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              )
                                  : widget.review == '2.5'
                                  ? Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              )
                                  : Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 15, color: starColor),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


