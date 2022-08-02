import 'package:flutter/material.dart';
import 'package:tal2a_seller_app/navigation_service.dart';
import 'package:tal2a_seller_app/presentation/resources/color_manager.dart';
import 'package:tal2a_seller_app/presentation/resources/styles_manager.dart';
import 'package:tal2a_seller_app/presentation/resources/values_manager.dart';

import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeaderWidget(),
            const SizedBox(
              height: AppSize.s18,
            ),
            Text(
              'الرصيد',
              style: getBoldStyle(color: ColorManager.grey, fontSize: 18),
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
            Row(
              children: const [

                Expanded(
                    child: BalanceBtn(title: 'أجمالي',count:'21500' ,color: ColorManager.purple,)
                ),

                SizedBox(
                  width: 8,
                ),

                Expanded(
                    child: BalanceBtn(title: 'مسدد',count:'20500' ,color: ColorManager.grey2,)
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: BalanceBtn(title: 'متبقي',count:'1000' ,color: ColorManager.green,)
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
            Row(
              children: [
                Text(
                  'الشحنات',
                  style: getBoldStyle(color: ColorManager.grey, fontSize: 18),
                ),
                const Spacer(),
                TextButton(onPressed: (){}, child: Text(
                  'عرض الكل',
                  style:
                  getBoldStyle(color: ColorManager.primary, fontSize: 16),
                )),
              ],
            ),
            const SizedBox(
              height: AppSize.s4,
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                        child: ShipmentBtn(title: 'في المخزن',count: '5',color: ColorManager.purple,)
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: ShipmentBtn(title: 'في التوصيل',count: '15',color: ColorManager.orange,)),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Row(
                  children: const[
                    Expanded(
                        child: ShipmentBtn(title: 'مرتجعات',count: '0',color: ColorManager.grey2,)
                    ),
                     SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: ShipmentBtn(title: 'تم التوصيل',count: '45',color: ColorManager.green,)
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},

      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey3),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 60,
                height: 60,
                color: ColorManager.lightPrimary,
              ),
            ),
            const SizedBox(
              width: AppSize.s12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اسم المتجر',
                  style: getBoldStyle(
                      color: ColorManager.grey, fontSize: 18),
                ),
                Text(
                  'اسم العميل',
                  style: getSemiBoldStyle(
                      color: ColorManager.grey2, fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShipmentBtn extends StatelessWidget {
  final String title,count;
  final Color color;
  const ShipmentBtn({Key? key, required this.title, required this.count, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 2,
      borderRadius: BorderRadius.circular(AppSize.s8),
      child: InkWell(
        onTap: () {
          NavigationService.instance.navigateTo(Routes.shipmentRoute);
        },
        borderRadius: BorderRadius.circular(AppSize.s8),
        splashColor: Colors.white,
        child: Container(
          height: AppSize.s100,
          padding: const EdgeInsets.all(AppPadding.p4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: FontSize.s18),
              ),
              Text(
                count,
                maxLines: 3,
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: FontSize.s22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceBtn extends StatelessWidget {
  final String title,count;
  final Color color;
  const BalanceBtn({Key? key, required this.title, required this.count, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 2,
      borderRadius: BorderRadius.circular(AppSize.s8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppSize.s8),
        splashColor: Colors.white,
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: 18),
              ),
              Text(
                count,
                maxLines: 2,
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: 20),
              ),
              Text(
                'ج.م',
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}