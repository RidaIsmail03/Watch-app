import 'package:flutter/material.dart';
import 'cart.dart';
import 'sidebar.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late PageController _pageController;
  List<String> images = [
    "images/slider0.webp",
    "images/slider1.webp",
    "images/slider2.webp",
    "images/home3.jpg",
  ];

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    super.initState();
  }

  int activePage = 1;

  List<Widget> indicators(imagesLength,currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  AnimatedContainer slider(images,pagePosition,active){
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(images[pagePosition]))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: const NavDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            setState(() { // open the search product page
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Search())
              );
            });
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            setState(() { // open the search product page
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartList())
              );
            });
          }, icon: const Icon(Icons.shopping_cart), color: Colors.black,)
        ],
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text('M', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),),
              Image.asset('images/watch_logo.jpg', width: 60, height: 60,),
              const Text('R', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal,),)
            ]),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:Column(
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                itemCount: images.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  bool active = pagePosition == activePage;
                  return slider(images,pagePosition,active);
                }
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(images.length,activePage)
          ),
          const SizedBox(height: 20,),
          Column(
            children: [
              const Text('Featured Brands', style: TextStyle(fontSize: 30, color: Colors.white),),
              const SizedBox(height: 10,),
              const SizedBox(
                width: 350,
                child: Text('From the biggest design brands, to the best of luxury and hidden gems. See our featured brands...',
                  style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/brand1.jpg', width: 150, height: 150,),
                  Image.asset('images/brand2.jpg', width: 150, height: 150,),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/brand3.jpg', width: 150, height: 150,),
                  Image.asset('images/brand4.jpg', width: 150, height: 150,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
