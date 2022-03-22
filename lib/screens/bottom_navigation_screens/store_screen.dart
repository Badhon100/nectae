
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({ Key? key }) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {


List<String> _carouselImages = [];
int dotIndicator = 0;

fetchCarouselImage()async{
  var _firestoreInstance = FirebaseFirestore.instance;
  QuerySnapshot qn = await _firestoreInstance.collection("carousel-slider").get();

  setState(() {
    for(int i = 0; i < qn.docs.length; i++){
      _carouselImages.add(
      qn.docs[i]["path"]
    );
    }
  });
}

@override
  void initState() {
    fetchCarouselImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset("assets/img/logo_orange.png"),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                             Icon(Icons.location_pin),
                            Text(
                              "Dhaka, Banassre",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
               Expanded(
                 flex: 1,
                child: SizedBox(
                  height: 25,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 20, 20, 20)),
                        borderRadius: BorderRadius.circular(23)
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Store"
                  ),
                )
              )
              ),
              SizedBox(
                height: 10.h,
              ),
              AspectRatio(
                aspectRatio: 3.5,
                child: CarouselSlider(
                  items: _carouselImages.map((item) => Padding(
                    padding: const EdgeInsets.only(left:8.0,),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(item), fit: BoxFit.fitWidth)
                      ),
                    ),
                  )).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (val, carouselChangedReason){
                      setState(() {
                        dotIndicator = val;
                      });
                    }
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: _carouselImages.isEmpty?1: _carouselImages.length,
                position: dotIndicator.toDouble(),
                decorator: const DotsDecorator(
                  activeColor: Color(0xFF53B175),
                  color: Color.fromARGB(179, 185, 183, 183),
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(8,8),
                  size: Size(6, 6)
                ),
              ),
              const Expanded(
                flex: 8,
                child: Text("hello"),
              ),
            ],
          ),
        )
      ),
    );
  }
}