import 'package:day10/pages/weather_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      setState((() => _isCityNameEmpty = _controller.text.isEmpty));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.sunny_snowing)),
          title: const Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please enter city name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    label: Text('City Name'),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(),
                  ),
                )
            ),
            ElevatedButton(
              child: Text('Search'),
                onPressed: _isCityNameEmpty ? null: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherDetail(
                            cityName: _controller.text,
                        ),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
