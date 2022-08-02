import 'package:flutter/material.dart';
import 'package:tal2a_seller_app/navigation_service.dart';
import 'package:tal2a_seller_app/presentation/resources/color_manager.dart';
import 'package:tal2a_seller_app/presentation/resources/styles_manager.dart';
import 'package:tal2a_seller_app/presentation/shipments/shipment_details.dart';

class ShipmentScreen extends StatelessWidget {
  const ShipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.offWhite,
        appBar: AppBar(title: const Text('شحناتي')),
        body: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding:const EdgeInsetsDirectional.only(start: 8,end: 8,top: 8,bottom: 4),
                child: Text('عدد الشحنات (2)',style: getBoldStyle(color: ColorManager.grey),),
              ),
            ),
            Column(
              children: const[
                ShipmentCard(),
                ShipmentCard()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShipmentCard extends StatelessWidget {

  const ShipmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: (){
            NavigationService.instance.navigateToWidget(ShipmentDetails());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('الطلب رقم 12223566',style: getBoldStyle(color: ColorManager.grey),),
                    const Spacer(),
                    Text('عرض التفاصيل >',style: getBoldStyle(color: ColorManager.primary))
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: Text('اسم المستلم',maxLines: 1,style: getBoldStyle(color: ColorManager.grey),)),
                    Text(' - ',style: getBoldStyle(color: ColorManager.grey),),
                    Flexible(child: Text('01055201231',maxLines: 1,style: getBoldStyle(color: ColorManager.grey),)),
                    Text(' - ',style: getBoldStyle(color: ColorManager.grey),),
                    Flexible(child: Text('القاهرة',maxLines: 1,style: getBoldStyle(color: ColorManager.grey),)),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('تفاصيل : ',style: getSemiBoldStyle(color: ColorManager.grey),),
                    Text('شاحن نوكيا سريع 900 وات',maxLines: 1,style: getRegularStyle(color: ColorManager.grey),),

                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('حالة الطلب : ',style: getBoldStyle(color: ColorManager.grey),),
                    Text('في المخزن',style: getBoldStyle(color: ColorManager.purple,fontSize: 16),),
                    const Spacer(),
                    Text('1500 ج.م',style: getBoldStyle(color: Colors.teal),),


                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

