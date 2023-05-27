import 'package:burchak_4/widgets/parallelogram_painter.dart';
import 'package:burchak_4/widgets/show_recs.dart';
import 'package:burchak_4/widgets/cool_drop_down.dart';
import 'package:flutter/material.dart';

import 'calculate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To'rt Burchak",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: "To'rt Burchak"),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({super.key, required this.title});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKeyA = new GlobalKey<FormState>();
  final formKeyB = new GlobalKey<FormState>();
  final formKeyH = new GlobalKey<FormState>();
  final List<String> _categories =
  ['Kvadrat', "To'g'ri to'rtburchak", 'Paralellogram', 'Romb'];
  final textA = TextEditingController();
  final textB = TextEditingController();
  final textH = TextEditingController();
  final String defaultC = 'Kvadrat';
  late String res = '';
  late int _selectedCategory = 0;
  late String result = '';






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff140093),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children:  [
          CoolDropDownButton(
            initialValue: defaultC,
            items: _categories.toList(),
            onChanged: (String newValue) {
              setState(() {
                if(newValue == _categories[0]){
                  _selectedCategory = 0;
                }
                if(newValue == _categories[1]){
                  _selectedCategory = 1;
                }
                if(newValue == _categories[2]){
                  _selectedCategory = 2;
                }
                if(newValue == _categories[3]){
                  _selectedCategory = 3;
                }
              });
            },
          ),
          Form(
            key: formKeyA,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: TextFormField(
                controller: textA,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Iltimos a ni kiriting!';
                  }
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "a Tomonini kiriting",
                    focusColor: Colors.blueAccent
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.blueAccent,

              ),
            ),
          ),
          if(_selectedCategory > 0)
            Form(
              key: formKeyB,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]
                ),
                child: TextFormField(
                  controller: textB,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'Iltimos b ni kiriting!';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "b Tomonini kiriting",
                      focusColor: Colors.blueAccent
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blueAccent,

                ),
              ),
            ),
          if(_selectedCategory > 1)
            Form(
              key: formKeyH,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]
                ),
                child: TextFormField(
                  controller: textH,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'Iltimos balandligini kiriting!';
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Balandligini kiriting",
                      focusColor: Colors.blueAccent
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.blueAccent,


                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                  onPressed: () {
                    if(_selectedCategory == 0 ? !formKeyA.currentState!.validate() : !formKeyA.currentState!.validate() ||  !formKeyB.currentState!.validate()){
                      setState(() {
                        res = "To'ldirilmagan qisimlarni to'ldiring";
                        result = 'ERROR';
                      });
                      return;
                    }
                    else{
                    setState(() {
                      res = 'Perimetiri';
                    });
                    late double inputA = double.tryParse(textA.text) ?? 0;
                    late double inputB = double.tryParse(textB.text) ?? 0;
                    late double inputH = double.tryParse(textH.text) ?? 0;

                    switch(_selectedCategory){
                      case 0 :
                        setState(() {
                          result = CalculateKvadrat().periCal(inputA).toString();
                        });
                        break;
                      case 1 :
                        setState(() {
                          result = CalculateTBurchak().periCal(inputA, inputB).toString();
                        });
                        break;
                      case 2 :
                        setState(() {
                          result = CalculateParalellogram().periCal(inputA, inputB, inputH ?? 0).toString();
                        });
                        break;
                      case 3 :
                        setState(() {
                          result = CalculateRomb().periCal(inputA, inputB, inputH).toString();
                        });
                        break;
                      default :
                        print('ERROR');
                    }
                    }
                    },
                  child: const Text('Perimetiri'),
              ),
              OutlinedButton(
                  onPressed: () {
                    if(_selectedCategory == 0 ? !formKeyA.currentState!.validate()
                        : _selectedCategory == 1 ? !formKeyA.currentState!.validate() ||  !formKeyB.currentState!.validate() :
                    !formKeyH.currentState!.validate() || !formKeyA.currentState!.validate() || !formKeyB.currentState!.validate()){
                      setState(() {
                        res = "To'ldirilmagan qisimlarni to'ldiring";
                        result = 'ERROR';
                      });
                      return;

                    }
                    setState(() {
                      res = 'Yuzi';
                    });
                    late double inputA = double.tryParse(textA.text) ?? 0;
                    late double inputB = double.tryParse(textB.text) ?? 0;
                    late double inputH = double.tryParse(textH.text) ?? 0;
                    switch(_selectedCategory){
                      case 0 :
                        setState(() {
                          result = CalculateKvadrat().yuziCal(inputA).toString();
                        });
                        break;
                      case 1 :
                        setState(() {
                          result = CalculateTBurchak().yuziCal(inputA, inputB).toString();
                        });
                        break;
                      case 2 :
                        setState(() {
                          result = CalculateParalellogram().yuziCal(inputA, inputB, inputH).toString();
                        });
                        break;
                      case 3 :
                        setState(() {
                          result = CalculateRomb().yuziCal(inputA, inputB, inputH).toString();
                        });
                        break;
                      default :
                        print('ERROR');
                    }
                  },
                  child: const Text('Yuzi'),
              ),
              OutlinedButton(
                  onPressed: () {
                    if(_selectedCategory == 0
                        ? !formKeyA.currentState!.validate()
                        : !formKeyA.currentState!.validate()
                        ||  !formKeyB.currentState!.validate()){
                      setState(() {
                        res = "To'ldirilmagan qisimlarni to'ldiring";
                        result = 'ERROR';
                      });
                      return;
                    }
                    setState(() {
                      res = 'Diagonali';
                    });
                    late double inputA = double.tryParse(textA.text) ?? 0;
                    late double inputB = double.tryParse(textB.text) ?? 0;
                    late double inputH = double.tryParse(textH.text) ?? 0;

                    switch(_selectedCategory){
                      case 0 :
                        setState(() {
                          result = CalculateKvadrat().diagCal(inputA).toString();
                        });
                        break;
                      case 1 :
                        setState(() {
                          result = CalculateTBurchak().diagCal(inputA, inputB).toString();
                        });
                        break;
                      case 2 :
                        setState(() {
                          result = CalculateParalellogram().diagCal(inputA, inputB, inputH).toString();
                        });
                        break;
                      case 3 :
                        setState(() {
                          result = CalculateRomb().diagCal(inputA, inputB, inputH).toString();
                        });
                        break;
                      default :
                        print('ERROR');
                    }
                  },
                  child: const Text('Diagonali'),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
               child: res != '' ? Text("$res = $result", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),) : null,
            ),
          ),
          const SizedBox(height: 20,),
          //ParallelogramContainer(width: double.tryParse(textA.text) ?? 20, height: double.tryParse(textB.text) ?? 20,),
          if(double.tryParse(textA.text) != null)
            ShowRecs(selectedCaty: _selectedCategory, width: double.tryParse(textA.text) ?? 20, height: double.tryParse(textB.text) ?? 20,),
        ],
      ),
    );
  }
}