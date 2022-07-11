
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final dummyItems = [
  'https://cdn.class101.net/images/146ca084-e65b-4bfa-93d7-80db2ed65b90',
  'https://www.walkerhillstory.com/wp-content/uploads/2020/09/2-1.jpg',
  'https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg'
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages =[
    Page1(),Page2(),Page3()
  ]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Colors.black,iconSize: 30,)],
        title: Text('복잡한 ui',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index = index; 
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment),label: '이용서비스'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: '내 정보')
        ]),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _top(),
        _mid(),
        _bot()
      ],
    )
    ;
  }
}

Widget _top(){
  return GestureDetector(
    onTap: (){
      print('click');
    },
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(onPressed: (){print('click');}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('바이크',textAlign: TextAlign.center,)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시')
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시')
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시')
              ],
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시')
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시',)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시')
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.local_taxi,size: 40,)),
                Text('택시')
              ],
            )
          ],
        ),
      ],
    ),
  );
  }

Widget _mid(){
  return CarouselSlider(
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3)
        ),
        items: dummyItems.map((url){
          return Builder(
            builder:(BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin:EdgeInsets.symmetric(horizontal: 5.0),
                
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(url,fit:BoxFit.cover)),
              );
            }
            );            
        }).toList(),
      );
}
Widget _bot(){
  final items = List.generate(10,(i){
    return ListTile(
      leading: Icon(Icons.notifications_none),
      title: Text('[이벤트] 공지사항'),
    );
  });
  return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: items,
  );
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('이용서비스'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('내 정보'),
    );
  }
}