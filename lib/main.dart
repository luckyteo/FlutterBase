import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_clean_architecture/app.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //apply portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainApp();
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ContainerRepository extends StatelessWidget {
  final Widget? child;

  const ContainerRepository({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: child!,
    );
  }
}

//|||||||||||||||||||
//  ADD BLOC HERE  ||
//|||||||||||||||||||
class ContainerBloc extends StatelessWidget {
  final Widget? child;

  const ContainerBloc({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: child!,
    );
  }
}
