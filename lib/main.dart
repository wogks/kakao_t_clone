import 'package:flutter/material.dart';

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
    return Column(
      children: [
        _top(),
        _mid(),
        _bot()
      ],
    )
    ;
  }
}

Widget _top(){
  return Text('top');
}
Widget _mid(){
  return Text('mid');
}
Widget _bot(){
  return Text('bot');
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