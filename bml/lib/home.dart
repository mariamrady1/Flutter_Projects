import 'result.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  dynamic result;
  int age = 18;
  int weight = 55;
  double heightvel = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Body Max Index", style: TextStyle(color: Colors.teal)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        m1Expanded(context, 'male'),
                        const SizedBox(
                          width: 15,
                        ),
                        m1Expanded(context, 'female'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal),
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(heightvel.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline2),
                          const Text(
                            "cm",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Slider(
                          min: 90,
                          max: 220,
                          value: heightvel,
                          onChanged: ((value) {
                            setState(() {
                              heightvel = value;
                            });
                          }))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.teal,
                child: TextButton(
                  onPressed: () {
                    result = weight / pow(heightvel / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) {
                        return Result(result: result, ismale: ismale, age: age);
                      })),
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: (() {
          setState(() => ismale = (type == 'male') ? true : false);
        }),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (ismale == true && type == 'male') ||
                    (!ismale == true && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  type == 'male' ? Icons.male : Icons.female,
                  size: 110,
                ),
                SizedBox(
                  height: .1,
                ),
                Text(
                  type == 'male' ? 'male' : 'female',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == 'weight' ? 'weight' : 'age',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                type == 'weight' ? '$weight' : '$age',
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'weight' ? weight++ : age++,
                    onPressed: () {
                      setState(() => type == 'weight' ? weight++ : age++);
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: type == 'weight' ? weight-- : age--,
                    onPressed: () {
                      setState(() => type == 'weight' ? weight-- : age--);
                    },
                    child: const Icon(Icons.remove),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
