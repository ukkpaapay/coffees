import 'package:flutter/material.dart';
import 'package:pagelist/coffees.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(viewportFraction: 0.35);
  double _currentPage = 0.0;

  void _pageScrollListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_pageScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageScrollListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Transform.scale(
          scale: 1.6,
          alignment: Alignment.bottomCenter,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: coffees.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox.shrink();
              }
              final coffee = coffees[index - 1];
              final result = _currentPage - index + 1;
              final value = -0.4 * result + 1;
              final opacity = value.clamp(0.0, 1.0);
              print(result);
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(
                        0.0,
                        MediaQuery.of(context).size.height /
                            2.6 *
                            (1 - value).abs())
                    ..scale(value),
                  child: Opacity(
                      opacity: opacity,
                      child: Image.asset(
                        coffee.image,
                        fit: BoxFit.fitHeight,
                      )),
                ),
              );
            },
          ),
        ));
  }
}
