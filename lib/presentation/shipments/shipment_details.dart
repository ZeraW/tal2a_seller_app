import 'package:flutter/material.dart';
import 'package:tal2a_seller_app/presentation/resources/color_manager.dart';
import 'package:tal2a_seller_app/presentation/resources/styles_manager.dart';

class ShipmentDetails extends StatelessWidget {
  const ShipmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.offWhite,
          appBar: AppBar(title: const Text('تفاصيل الشحنة')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'رقم الطلب - 12223566',
                        style: getBoldStyle(
                            color: ColorManager.grey, fontSize: 16),
                      ),
                      Text(
                        'تم الطلب بتاريخ - 10/07/2022',
                        style: getRegularStyle(color: ColorManager.grey),
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'عنوان الشحن',
                            style: getBoldStyle(
                                color: ColorManager.grey, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'اسم المستلم',
                            style: getRegularStyle(color: ColorManager.grey2),
                          ),
                          Text(
                            '17 ش جلال الدين الدسوقى متفرع من ش الميرغنى - السبع عمارات',
                            style: getRegularStyle(color: ColorManager.grey2),
                          ),
                          Text(
                            'مصر الجديدة - القاهرة',
                            style: getRegularStyle(color: ColorManager.grey2),
                          ),
                          const Divider(),
                          Text(
                            'رقم الهاتف',
                            style: getBoldStyle(
                                color: ColorManager.grey, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('01020305510',
                              style:
                              getRegularStyle(color: ColorManager.grey2)),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ShipmentStatus(),
                      const Divider(),
                      Text(
                        'عدد 5 بلحة و 7 بطاطس',
                        style: getBoldStyle(color: ColorManager.grey),
                      ),
                      Row(
                        children: [
                          Text('الكمية: ',
                              style:
                              getRegularStyle(color: ColorManager.grey)),
                          Text('12',
                              style:
                              getRegularStyle(color: ColorManager.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('تكلفه الشحنة',
                              style:
                              getRegularStyle(color: ColorManager.grey)),
                          const Spacer(),
                          Text('1500 ج.م',
                              style:
                              getRegularStyle(color: ColorManager.grey))
                        ],
                      ),
                      Row(
                        children: [
                          Text('رسوم الشحن',
                              style:
                              getRegularStyle(color: ColorManager.grey)),
                          const Spacer(),
                          Text('30 ج.م',
                              style:
                              getRegularStyle(color: ColorManager.grey))
                        ],
                      ),
                      const Divider(
                        color: ColorManager.grey,
                      ),
                      Row(
                        children: [
                          Text('الاجمالي',
                              style:
                              getRegularStyle(color: ColorManager.grey)),
                          const Spacer(),
                          Text('1530 ج.م',
                              style:
                              getRegularStyle(color: ColorManager.grey))
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تتبع الشحنة',
                        style: getBoldStyle(
                            color: ColorManager.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWithBubble(
                        date: DateTime.now(),
                        title: 'فشل التسليم',
                        subTitle: 'لم يقم العميل بالرد علي الهاتف رغم المحاولة اكثر من مرة',fail: true,),
                      TextWithBubble(
                          date: DateTime.now(),
                          title: 'في الشحن',
                          subTitle: 'تم تعين مندوب الشحن وفي الطريق'),
                      TextWithBubble(
                          isFirst: true,
                          date: DateTime.now(),
                          title: 'وصلت المخزن',
                          subTitle: 'تم استلام الطرد بالمخزن')
                    ],
                  )
              ),
            ],
          ),
        )
        ),
      );
  }
}

class TextWithBubble extends StatelessWidget {
  final bool? isFirst, fail;

  final DateTime date;
  final String title, subTitle;

  const TextWithBubble(
      {Key? key,
      this.isFirst = false,
      required this.date,
      required this.title,
      required this.subTitle,
      this.fail = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                fail!
                    ? const Icon(
                        Icons.cancel,
                        size: 22,
                        color: ColorManager.error,
                      )
                    : const Icon(
                        Icons.check_circle,
                        size: 22,
                        color: ColorManager.green,
                      ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Jul 12 , 2022 at 15:00',
                  style: getBoldStyle(color: ColorManager.grey, fontSize: 11),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: isFirst! ? Colors.transparent : ColorManager.grey3,
                  width: 1,
                  height: 65,
                  margin: const EdgeInsetsDirectional.only(
                      start: 10, top: 4, bottom: 4, end: 8),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        subTitle,
                        maxLines: 2,
                        style:
                            getRegularStyle(color: ColorManager.grey2, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        title,
                        maxLines: 1,
                        style: getMediumStyle(color: ColorManager.grey, fontSize: 13),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ShipmentStatus extends StatelessWidget {
  const ShipmentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              height: 5,
              color: ColorManager.green,
            )),
            const SizedBox(
              width: 8,
            ),
            Expanded(child: Container(height: 5, color: ColorManager.grey3)),
            const SizedBox(
              width: 8,
            ),
            Expanded(child: Container(height: 5, color: ColorManager.grey3)),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              'في المخزن',
              style: getBoldStyle(color: ColorManager.green),
            ),
            const Spacer(),
            Text('الاحد , يوليو 10',
                style: getBoldStyle(color: ColorManager.grey))
          ],
        )
      ],
    );
  }
}
