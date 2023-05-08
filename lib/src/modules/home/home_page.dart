import 'package:flutter/material.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/message.dart';
import '../../core/ui/helpers/size_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showLoader();
          await Future.delayed(const Duration(seconds: 3));
          hideLoader();
          showError('Alguma coisa');
        },
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          color: Colors.red,
          width: context.percentWidth(.5),
          height: context.percentHeight(.9),
          child: Text(
            context.screenWidth.toString(),
          ),
        ),
      ),
    );
  }
}
