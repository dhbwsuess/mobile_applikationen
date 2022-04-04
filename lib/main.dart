import 'importe.dart';

void main() {
  TestProvider.initSharedPreferences();
  TestProvider.checkDarkmode();
  runApp(const MyApp());
}

class TestProvider extends ChangeNotifier {
  static var prefs;
  int index = 0;
  int spalten = 1;
  static bool darkmode = false;

  int numberCount = 1;
  List<Themen> listi = [Themen("Test",Icon(Icons.bike_scooter), Colors.greenAccent, [], [0,0],),];

  static checkDarkmode () {
    try {
      darkmode = prefs.getBool("darkmode");
    } catch(e) {
      darkmode = false;
    }
  }

  static initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
  setSharedPreferences() async {
    await prefs.setList(marvin: listi);
  }
  updateListi(String titel, Icon icon, Color farbe, List fragen, List statistik,) {
    listi = [Themen(titel, icon, farbe, fragen, statistik,), ...listi];
    numberCount += 1;
    notifyListeners();
  }

  updateProvider() {
    notifyListeners();
  }

  changeMode () {
    darkmode = !darkmode;
    notifyListeners();
  }

  changeColumnNumber() {
    spalten += 1;
    if (spalten > 3) {
      spalten = 1;
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => TestProvider(),
      child: Themii(),
    );
  }
}

class Themii extends StatefulWidget {
  const Themii({Key? key}) : super(key: key);

  @override
  _ThemiiState createState() => _ThemiiState();
}

class _ThemiiState extends State<Themii> {
  @override
  Widget build(BuildContext context) {

    var state = context.watch<TestProvider>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeDataErstellen(state),
      home: const Einloggen(),
    );
  }

  ThemeData themeDataErstellen (TestProvider state) {
    if (TestProvider.darkmode == true) {
      return ThemeData(
        brightness: Brightness.dark,
      );
    } else {
      return ThemeData(
        brightness: Brightness.light,
      );
    }
  }

}