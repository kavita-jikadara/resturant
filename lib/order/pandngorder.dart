import 'package:admin_panel/apiService.dart';
import 'package:admin_panel/commonWidget.dart';
import 'package:admin_panel/restaurantData.dart';
import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pandingorder extends StatefulWidget {
  const pandingorder({super.key});

  @override
  State<pandingorder> createState() => _pandingorderState();
}

class _pandingorderState extends State<pandingorder> {
  ApiService apiService = ApiService();
  CommonWidget commonWidget = CommonWidget();
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
      'status': 0,
      'length': 10,
      'start': _page,
    });

    var res = await apiService.postCall('getOrderData.php', formData);

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
      _page = _page + 10;
      var resData =
          Provider.of<RestaurantData>(context, listen: false).getResData();
      final formData = FormData.fromMap({
        'rid': resData['resid'],
        'status': 0,
        'length': 10,
        'start': _page,
      });

      var res = await apiService.postCall('getOrderData.php', formData);

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
                      margin:
                          EdgeInsets.only(top: 5, bottom: 5, left: 2, right: 2),
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
                              Text(
                                "${productData[index]['uname']}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${productData[index]['pname']}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${productData[index]['uaddress']}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ ${productData[index]['totalamount']}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final formData = FormData.fromMap({
                              'oid': productData[index]['oid'],
                              'status': 1,
                            });
                            var res = await apiService.postCall(
                                "changeOrderStatus.php", formData);
                            commonWidget.toastSuccess(context, res['message']);
                            if (res['status'] == true) {
                              _page = 0;
                              await init();
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 84, 198, 87),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                                child: Text(
                              "Accept",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final formData = FormData.fromMap({
                              'oid': productData[index]['oid'],
                              'status': 2,
                            });
                            var res = await apiService.postCall(
                                "changeOrderStatus.php", formData);
                            commonWidget.toastSuccess(context, res['message']);
                            if (res['status'] == true) {
                              _page = 0;
                              await init();
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
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
              }),
        ),
      ),
    );
  }
}
