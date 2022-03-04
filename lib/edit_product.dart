import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_curtain/add_customer.dart';
import 'package:project_curtain/constants/constants.dart';
import 'package:project_curtain/details_product.dart';
import 'package:project_curtain/format.dart';
import 'package:project_curtain/page/customer_screen.dart';
import 'package:project_curtain/page/home_screen.dart';
import 'package:project_curtain/page/order_screen.dart';
import 'package:project_curtain/page/product_screen.dart';
import 'package:project_curtain/page/receipt_screen.dart';
import 'package:project_curtain/page/setting_screen.dart';
import 'package:project_curtain/search_product.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EditDetailScreen extends StatefulWidget {
  const EditDetailScreen({Key? key}) : super(key: key);

  @override
  _EditDetailScreenState createState() => _EditDetailScreenState();
}

final List<String> imgList = [
  'assets/images/detail_product_curtain1.png',
  'assets/images/detail_product_curtain2.png',
  'assets/images/detail_product_curtain3.png',
  'assets/images/detail_product_curtain4.png',
  'assets/images/detail_product_curtain5.png',
  'assets/images/detail_product_curtain6.png',
];

final List<String> code = [
  'AC01CY04',
  'AC01CY04',
  'AC01CY04',
];

final List<Color> color = [
  colortext1,
  colortext2,
  const Color(0xFFE9E9E9),
];

int selectImage = 0;
int selectCode = 0;
int selectColor = 0;
double result = 0;
bool isChecked = false;
double heightCurtain = 0;
double widthCurtain = 0;
double priceCurtain = 0;
final TextEditingController widthController = TextEditingController();
final TextEditingController heightController = TextEditingController();
final CarouselController _controller = CarouselController();

class _EditDetailScreenState extends State<EditDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(
          'PRODUCT',
          style: GoogleFonts.kanit(color: Colors.black, fontSize: subtitle),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.search,
              color: colorBlack,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ค้นหา',
                              hintStyle: GoogleFonts.kanit(color: colortext2)),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchProduct()));
                        },
                        icon: const Icon(
                          Icons.search,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 2, vertical: defaultPadding),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context, builder: (_) => const ImageDialog());
                },
                child: SizedBox(
                    width: 453,
                    height: 214,
                    child: Image.asset(imgList[selectImage])),
              ),
              const SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    imgList.length,
                    (index) => buildSmallPreview(index),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              Text('ม่านสองชั้น', style: GoogleFonts.kanit(fontSize: subtitle)),
              const SizedBox(height: defaultPadding),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('ชนิดผ้า :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext))
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(' ผ้าทึบหน้าแคบ Acacia',
                                  style: GoogleFonts.kanit(
                                      color: colortext2, fontSize: bodytext)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('รหัสสินค้า :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext))
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...List.generate(
                                code.length,
                                (index) => buildSelectCode(index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('เลือกสี :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext))
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // ...List.generate(
                              //   color.length,
                              //   (index) => buildSelectColor(index),
                              // ),
                              ...List.generate(
                                  3,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectColor = index;
                                          });
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          height: 33.5,
                                          width: 148,
                                          decoration: BoxDecoration(
                                            color: color[index],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: selectColor == index
                                                  ? colorBlack
                                                  : Colors.transparent,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: colorBgBtn2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('ราคา/ชิ้น :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext))
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(' ฿400',
                                  style: GoogleFonts.kanit(
                                      color: colortext2, fontSize: bodytext)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('ความสูง :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                    thumbStrokeWidth: 3,
                                    thumbStrokeColor: colortext1,
                                    thumbColor: Colors.white,
                                  ),
                                  child: SfSlider(
                                    min: 0.0,
                                    max: 100.0,
                                    value: heightCurtain,
                                    inactiveColor: colortext2,
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        heightCurtain = newValue;
                                        heightController.text =
                                            newValue.toStringAsFixed(2);
                                        valueChange();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: defaultPadding),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding),
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: colorBgBtn2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2)),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: heightController,
                                        onChanged: (value) {
                                          var formatValue =
                                              value.isEmpty ? '0' : value;
                                          if (double.parse(formatValue) >=
                                              100.00) {
                                            setState(() {
                                              heightCurtain = 100.00;
                                              heightController.text =
                                                  heightCurtain.toString();
                                            });
                                          } else {
                                            setState(() {
                                              heightCurtain =
                                                  double.parse(formatValue);
                                            });
                                          }
                                          valueChange();
                                        },
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        inputFormatters: [
                                          MoneyInputFormatter()
                                        ],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '0.00',
                                          hintStyle: GoogleFonts.kanit(
                                              color: colortext2),
                                        ),
                                        style: GoogleFonts.kanit(
                                            color: colortext2),
                                      ),
                                    ),
                                    Text(
                                      'เมตร',
                                      style: GoogleFonts.kanit(
                                          color: colortext2,
                                          fontSize: bodytext),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('ความกว้าง :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                    thumbStrokeWidth: 3,
                                    thumbStrokeColor: colortext1,
                                    thumbColor: Colors.white,
                                  ),
                                  child: SfSlider(
                                    min: 0.0,
                                    max: 100.0,
                                    value: widthCurtain,
                                    inactiveColor: colortext2,
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        widthCurtain = newValue;
                                        widthController.text =
                                            newValue.toStringAsFixed(2);
                                        valueChange();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding),
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: colorBgBtn2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2))
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: widthController,
                                        onChanged: (value) {
                                          var formatValue =
                                              value.isEmpty ? '0' : value;
                                          if (double.parse(formatValue) >=
                                              100.00) {
                                            setState(() {
                                              widthCurtain = 100.00;
                                              widthController.text =
                                                  widthCurtain.toString();
                                            });
                                          } else {
                                            setState(() {
                                              widthCurtain =
                                                  double.parse(formatValue);
                                            });
                                          }
                                          valueChange();
                                        },
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        inputFormatters: [
                                          MoneyInputFormatter()
                                        ],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '0.00',
                                          hintStyle: GoogleFonts.kanit(
                                              color: colortext2),
                                        ),
                                        style: GoogleFonts.kanit(
                                            color: colortext2),
                                      ),
                                    ),
                                    const SizedBox(width: defaultPadding),
                                    Text(
                                      'เมตร',
                                      style: GoogleFonts.kanit(
                                          color: colortext2,
                                          fontSize: bodytext),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('ราคาผ้าม่าน (บาท) :',
                                  style: GoogleFonts.kanit(
                                      color: colortext1, fontSize: bodytext)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: SfSliderTheme(
                                  data: SfSliderThemeData(
                                    thumbStrokeWidth: 3,
                                    thumbStrokeColor: colortext1,
                                    thumbColor: Colors.white,
                                  ),
                                  child: SfSlider(
                                    min: 0.0,
                                    max: 100.0,
                                    value: priceCurtain,
                                    inactiveColor: colortext2,
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        priceCurtain = newValue;
                                        valueChange();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              Text(
                                '${priceCurtain.toStringAsFixed(2)}',
                                style: GoogleFonts.kanit(
                                    color: colortext2, fontSize: bodytext),
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              Text(
                                'บาท',
                                style: GoogleFonts.kanit(
                                    color: colortext2, fontSize: bodytext),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CupertinoSwitch(
                                      thumbColor: colorWhite,
                                      // trackColor: colortext1,
                                      activeColor: colortext1,
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = !isChecked;
                                          valueChange();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: defaultPadding * 2),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  'สลับหน้าผ้า ',
                                  style: GoogleFonts.kanit(
                                      fontSize: bodytext, color: colortext1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'หมายเหตุ :',
                                style: GoogleFonts.kanit(
                                    fontSize: bodytext, color: colortext1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          flex: 4,
                          child: TextField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Column(
                        children: [
                          const Divider(
                            indent: 0,
                            height: defaultPadding,
                            thickness: 1,
                            color: Color(0xFF707070),
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'ราคารวม : ',
                                      style: GoogleFonts.kanit(
                                          fontSize: subtitle,
                                          color: colortext1),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '฿ ',
                                      style: GoogleFonts.kanit(
                                          fontSize: subtitle,
                                          color: colorBlack),
                                    ),
                                    Text(
                                      '${GoogleSignInApi.formatNumber(result)}',
                                      style: GoogleFonts.kanit(
                                          fontSize: subtitle,
                                          color: colorBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: colortext1,
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 12, bottom: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            )),
                        onPressed: () {
                          showConfirmDialog();
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: Text(
                          'เพิ่มเข้าออเดอร์',
                          style: GoogleFonts.kanit(
                              color: colorWhite, fontSize: bodytext),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showConfirmDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 28, horizontal: defaultPadding),
                width: MediaQuery.of(context).size.width * 0.56,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    Text('เจ้าของออเดอร์',
                        style: GoogleFonts.kanit(fontSize: bodytext)),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ชื่อลูกค้า',
                              hintStyle: GoogleFonts.kanit(
                                  color: Colors.grey, fontSize: bodytext),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddCustomer()));
                          },
                          icon: const Icon(Icons.add),
                          label: Text(
                            'เพิ่ม',
                            style: GoogleFonts.kanit(fontSize: bodytext),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              primary: const Color(0xFFD4D4D4),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ยกเลิก',
                              style: GoogleFonts.kanit(
                                  fontSize: bodytext, color: colortext1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              primary: colortext1,
                            ),
                            onPressed: () {
                              showIncressOrderComplete();
                            },
                            child: Text(
                              'ยืนยัน',
                              style: GoogleFonts.kanit(
                                  fontSize: bodytext, color: colorWhite),
                            ),
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

  void showIncressOrderComplete() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'เพิ่มออเดอร์สำเร็จ',
                  style: GoogleFonts.kanit(fontSize: bodytext),
                )),
          );
        });
  }

  // void calculate(double width, double price, double _height) {
  //   print('width');
  //   print(width);
  //   print('_height');
  //   print(_height);
  //   print('price');
  //   print(price);
  //   double total1 = (((1) * (width * 2.2) / 1) / 0.9) * price;
  //   double total2 = (((0.35 + _height) * (width * 2.2) / 1.4) / 0.9) * price;
  //   setState(() {
  //     result = isChecked ? total2 : total1;
  //   });
  // }
  void calculate(
      double widthCurtain, double priceCurtain, double heightCurtain) {
    // print('widthCurtain');
    // print(widthCurtain);
    // print('heightCurtain');
    // print(heightCurtain);
    // print('priceCurtain');
    // print(priceCurtain);
    double total1 = (((1) * (widthCurtain * 2.2) / 1) / 0.9) * priceCurtain;
    double total2 =
        (((0.35 + heightCurtain) * (widthCurtain * 2.2) / 1.4) / 0.9) *
            priceCurtain;
    setState(() {
      result = isChecked ? total2 : total1;
    });
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectImage = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          border:
              Border.all(color: selectImage == index ? colorBlack : colorWhite),
        ),
        child: Image.asset(imgList[index]),
      ),
    );
  }

  GestureDetector buildSelectCode(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectCode = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: 33.5,
        width: 143,
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: selectCode == index ? colorBlack : colorWhite),
          boxShadow: const [
            BoxShadow(
              color: colorBgBtn2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              code[index],
              style: GoogleFonts.kanit(),
            )),
      ),
    );
  }

  GestureDetector buildSelectColor(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectColor = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: 33.5,
        width: 143,
        decoration: BoxDecoration(
          color: color[selectColor],
          border: Border.all(
              color: selectColor == index ? colorBlack : Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: colorBgBtn2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(index.toString()),
      ),
    );
  }

  void next() =>
      _controller.nextPage(duration: const Duration(milliseconds: 500));
  void previous() =>
      _controller.previousPage(duration: const Duration(milliseconds: 500));

  void valueChange() {
    widthCurtain;
    heightCurtain;
    priceCurtain;
    calculate(widthCurtain, priceCurtain, heightCurtain);
    // double width = double.parse(widthController.value.text);
    // double price = double.parse(priceController.value.text);
    // double height = double.parse(heightController.value.text);
    // calculate(width, price, _height);
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Image.asset(imgList[selectImage]),
      ),
    );
  }
}
