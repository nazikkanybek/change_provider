import 'package:changee/providers/change_color_providers.dart';
import 'package:changee/providers/get_cats_data.dart';
import 'package:changee/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(
      create: (context) => MyProvider(),),ChangeNotifierProvider(
      create: (context) => ChangeColorProvider(),),ChangeNotifierProvider(
      create: (context) => GetCatsData(),),
      
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChangeColorProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: vm.color,
        leading: IconButton(
          icon:  Icon(vm.isDarkTheme? Icons.sunny: Icons.nightlight),
          onPressed: () {
            vm.changeColor();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField1(),
            SizedBox(
              height: 20,
            ),
            TextField2(),
            SizedBox(height: 20),
            Button(),
            SizedBox(height: 20),
            TextData(),

            CatsText(), 
            Button2()
          ],
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.read<GetCatsData>();
    return ElevatedButton(onPressed: (){
      vm.getCatsData();
    }, child:const Text('cats'),);
  }
}

class CatsText extends StatelessWidget {
  const CatsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<GetCatsData>();
    return Text(vm.model?.fact?? '');
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.read<MyProvider>();
    return ElevatedButton(
      onPressed: () {
        vm.getData();
      },
      child: const Text('press'),
    );
  }
}

class TextData extends StatelessWidget {
  const TextData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MyProvider>();
    return Text(vm.result);
  }
}

class TextField2 extends StatelessWidget {
  const TextField2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MyProvider>();
    return TextField(
      onChanged: (value) {
        vm.text1 = value;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}

class TextField1 extends StatelessWidget {
  const TextField1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MyProvider>();
    return TextField(
      onChanged: (value) {
        vm.text2 = value;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}


