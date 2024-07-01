import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CarouselDemo extends StatefulWidget {
  const CarouselDemo({super.key});


  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}


class _CarouselDemoState extends State<CarouselDemo> {


  final List<String> imgList = [
    'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: CarouselSlider(
              items: imgList.map((item)=>Container(
                child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
              )).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason){
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url){
                int index = imgList.indexOf(url);
                return GestureDetector(
                  onTap: (){
                    print('tapped');
                    _controller.animateToPage(index);
                  },
                  child: Container(
                    width: 18,
                    height: 18,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current==index?
                        Color.fromRGBO(0, 0, 0, 0.9)
                            :Color.fromRGBO(0, 0, 0, 0.4)
                    ),
                  ),
                );
              }).toList()
          )
        ],
      ),
    );
  }
}


