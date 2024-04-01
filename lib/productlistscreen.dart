import 'dart:developer';

import 'package:admin_panel/addproductscreen.dart';
import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/restaurantData.dart';
import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class plist extends StatefulWidget {
  const plist({super.key});

  @override
  State<plist> createState() => _plistState();
}

class _plistState extends State<plist> {
  ApiService apiService = ApiService();
  List productData = [];
  bool moreData = true;
  int _page = 0;
  int totalRecored = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController()..addListener(_loadMore);
    init();
  }

  init() async {
    _page = 0;
    var resData =
        Provider.of<RestaurantData>(context, listen: false).getResData();
    final formData = FormData.fromMap({
      'rid': resData['resid'],
      'length': 5,
      'start': _page,
    });

    var res = await apiService.postCall('getProductData.php', formData);

    if (mounted) {
      setState(() {
        productData = res['data'];
        totalRecored = res['totalRecord'];
        moreData = true;
      });
    }
  }

  void _loadMore() async {
    if (_scrollController.position.extentAfter < 300 &&
        moreData == true &&
        _page < totalRecored) {
      moreData = false;
      _page = _page + 5;
      var resData =
          Provider.of<RestaurantData>(context, listen: false).getResData();
      final formData = FormData.fromMap({
        'rid': resData['resid'],
        'length': 5,
        'start': _page,
      });

      var res = await apiService.postCall('getProductData.php', formData);

      if (mounted) {
        setState(() {
          if (res['data'] != null) {
            productData.addAll(res['data']);
            moreData = true;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "All Products",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pending(),
                    ));
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              )),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 248, 243, 243),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () async {
            _page = 0;
            await init();
          },
          child: ListView.builder(
            itemCount: productData.length,
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5, left: 2, right: 2),
                    child: Row(
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: productData[index]['pimage'] == ""
                                ? Image.asset(
                                    'assets/images/burger.jpeg',
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    "${apiService.url}/${productData[index]['pimage']}",
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Product Name:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                          text: ' ${productData[index]['pname']}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Product Type:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                          text: ' ${productData[index]['ptype']}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Product Category:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                          text: ' ${productData[index]['category']}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Price:',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                          text: '₹ ${productData[index]['price']}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: Colors.grey,
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
