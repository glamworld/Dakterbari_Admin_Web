import 'package:admin_panel_web/model/article_model.dart';
import 'package:admin_panel_web/model/featured_product_model.dart';
import 'package:admin_panel_web/model/hospital_model.dart';
import 'package:admin_panel_web/model/medicine_model.dart';
import 'package:admin_panel_web/model/shop_model.dart';
import 'package:admin_panel_web/pages/add_discountshop_page.dart';
import 'package:admin_panel_web/pages/add_medicine_page.dart';
import 'package:admin_panel_web/pages/add_representative_page.dart';
import 'package:admin_panel_web/pages/all_blog_page.dart';
import 'package:admin_panel_web/pages/all_discountshop_page.dart';
import 'package:admin_panel_web/pages/all_doctor_page.dart';
import 'package:admin_panel_web/pages/all_medicine_page.dart';
import 'package:admin_panel_web/pages/all_notification_page.dart';
import 'package:admin_panel_web/pages/all_patient_page.dart';
import 'package:admin_panel_web/pages/all_representative_page.dart';
import 'package:admin_panel_web/pages/appointment_payment_page.dart';
import 'package:admin_panel_web/pages/article_details.dart';
import 'package:admin_panel_web/pages/dashboard_page.dart';
import 'package:admin_panel_web/pages/discountshop_payment_page.dart';
import 'package:admin_panel_web/pages/doctor_problem.dart';
import 'package:admin_panel_web/pages/new_doctor_page.dart';
import 'package:admin_panel_web/pages/new_patient_page.dart';
import 'package:admin_panel_web/pages/patient_problem_page.dart';
import 'package:admin_panel_web/pages/pending_medicine_page.dart';
import 'package:admin_panel_web/pages/register_doctor_page.dart';
import 'package:admin_panel_web/pages/send_notification_page.dart';
import 'package:admin_panel_web/pages/update_medicine.dart';
import 'package:admin_panel_web/pages/update_payment_page.dart';
import 'package:admin_panel_web/pages/write_blog_page.dart';
import 'package:admin_panel_web/pages/update_blog_page.dart';
import 'package:admin_panel_web/pages/pending_blog_page.dart';
import 'package:admin_panel_web/pages/pending_blog_details.dart';
import 'package:admin_panel_web/widgets/form_decorate.dart';
import 'package:admin_panel_web/pages/discount_shop_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_panel_web/pages/update_schedule.dart';
import 'package:admin_panel_web/pages/add_featured_product.dart';
import 'package:admin_panel_web/pages/update_doctor_page.dart';
import 'package:admin_panel_web/pages/add_hospitals.dart';
import 'package:flutter/material.dart';


class PublicProvider extends ChangeNotifier{
  String _category='';
  String _subCategory='';

  MedicineModel _medicineModel = MedicineModel();
  ArticleModel _articleModel = ArticleModel();
  HospitalModel _hospitalModel = HospitalModel();
  ShopModel _shopModel=ShopModel();
  FeaturedProductModel _featuredProductModel = FeaturedProductModel();

  String  get category=>_category;
  String get subCategory=> _subCategory;

  MedicineModel get medicineModel=>_medicineModel;
  ArticleModel get articleModel => _articleModel;
  ShopModel get shopModel=>_shopModel;
  HospitalModel get hospitalModel => _hospitalModel;
  FeaturedProductModel get featuredProductModel => _featuredProductModel;

  set subCategory(String value){
    _subCategory=value;
    notifyListeners();
  }
  set category(String value){
    _category=value;
    notifyListeners();
  }
  set medicineModel(MedicineModel model){
    model=MedicineModel();
    _medicineModel=model;
    notifyListeners();
  }
  set articleModel(ArticleModel model){
    model=ArticleModel();
    _articleModel=model;
    notifyListeners();
  }
  set shopModel(ShopModel model){
    model=ShopModel();
    _shopModel=model;
    notifyListeners();
  }
  set hospitalModel(HospitalModel model){
    model=HospitalModel();
    _hospitalModel=model;
    notifyListeners();
  }
  set featuredProductModel(FeaturedProductModel model){
    model=FeaturedProductModel();
    _featuredProductModel=model;
    notifyListeners();
  }

  double pageWidth(Size size){
    if(size.width<1300) return size.width;
    else return size.width*.8;
  }

  String pageHeader(){
     if(_category.isNotEmpty && _subCategory.isNotEmpty) return '$_category \u276D $_subCategory';
     else return 'Dashboard';
  }

  Widget pageBody(){
    if(subCategory=='All Doctor') return AllDoctorPage();
    if(subCategory=='Add Hospitals') return AddHospitals('add hospital');
    if(subCategory=='Update Doctor Schedule') return AddHospitals('');
    else if(subCategory=='New Doctor') return NewDoctorPage();
    else if(subCategory=='Register New Doctor') return RegisterDoctorPage();
    else if(subCategory=='Update Doctor') return UpdateDoctorPage();
    else if(subCategory=='All Patient') return AllPatientPage();
    else if(subCategory=='New Patient') return NewPatientPage();
    else if(subCategory=='All Medicine') return AllMedicinePage();
    else if(subCategory=='Add Medicine') return AddMedicinePage();
    else if(subCategory=='Update Medicine') return UpdateMedicine();
    else if(subCategory=='Pending Medicine') return PendingMedicinePage();
    else if(subCategory=='All Blog') return AllBlogPage();
    else if(subCategory=='Blog Details') return ArticleDetails();
    else if(subCategory=='Write Blog') return WriteBlogPage();
    else if(subCategory=='Update Blog') return UpdateBlogPage();
    else if(subCategory=='Pending Blog') return PendingBlogPage();
    else if(subCategory=='Pending Blog Details') return PendingBlogDetails();
    else if(subCategory=='All Representative') return AllRepresentativePage();
    else if(subCategory=='Add Representative') return AddRepresentativePage();
    else if(subCategory=='All Shop') return AllDiscountShopPage();
    else if(subCategory=='Add Shop') return AddDiscountShopPage();
    else if(subCategory=='Update Schedule') return UpdateSchedule();
    else if(subCategory=='Add Featured Product') return FeaturedProduct();
    else if(subCategory=='Discount Shop Details') return DiscountShopDetails();
    else if(subCategory=='All Notification') return AllNotificationPage();
    else if(subCategory=='Send Notification') return SendNotificationPage();
    else if(subCategory=='Patient Problems') return PatientProblemPage();
    else if(subCategory=='Doctor Problems') return DoctorProblemPage();
    else if(subCategory=='Discount Shop Payments') return DiscountShopPayment();
    else if(subCategory=='Appointment Payments') return AppointmentPaymentPage();
    else if(subCategory=='Dollar Unit & Appointment Charge') return UpdatePaymentPage();
    else return DashBoardPage();
  }

  Future<bool> validateAdmin(BuildContext context, String phone, String password)async{
    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Admin')
          .where('phone', isEqualTo: phone).get();
      final List<QueryDocumentSnapshot> user = snapshot.docs;
      if(user.isNotEmpty && user[0].get('password')==password){
        return true;
      }else{
        return false;
      }
    }catch(error){
      showToast(error.toString());
      return false;
    }
  }
}