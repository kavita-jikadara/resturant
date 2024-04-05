import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:admin_panel/apiService.dart';

import 'package:admin_panel/restaurantData.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({
    super.key,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  ApiService apiService = ApiService();
  double _userRating = 3.0;
  TextEditingController _reviewController = TextEditingController();

  var reviews = [];
  bool isLoading = true;
  getDetails() async {
    var userData =
        Provider.of<RestaurantData>(context, listen: false).getResData();
    final formData = FormData.fromMap({'rid': userData['resid']});
    var res = await apiService.postCall("review.php", formData);
    if (res['status'] == true) {
      setState(() {
        reviews = res['data'];
        isLoading = false;
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resturant Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? Center(
                      child: Container(
                        child: Text("Loading...."),
                      ),
                    )
                  : ListView.builder(
                      itemCount: reviews.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return ListTile(
                          title: Row(
                            children: [
                              Text(review['uname']),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                review['datetime'],
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBarIndicator(
                                rating: double.parse(review['rating']),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                              ),
                              const SizedBox(height: 8),
                              Text(review['review']),
                            ],
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future popup(message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
