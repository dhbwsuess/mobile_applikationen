import 'importe.dart';

class StatistikAlle extends StatefulWidget {
  const StatistikAlle({Key? key}) : super(key: key);

  @override
  _StatistikAlleState createState() => _StatistikAlleState();
}

class _StatistikAlleState extends State<StatistikAlle> {
  @override
  Widget build(BuildContext context) {

    var state = context.watch<TestProvider>();
    num richtig = 0;
    num falsch = 0;

    for (var obj in state.listi) {
      richtig += obj.statistik[0];
      falsch += obj.statistik[1];
    }



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Anzahl aller richtigen Antworten: $richtig"),
            Text("Anzahl aller falschen Antworten: $falsch"),
            ElevatedButton(
                onPressed: () => statistikZuruecksetzen(state),
                child: const Text("Statistik aller Themen zurücksetzen"))
          ],
        ),
      ),
    );
  }

  void statistikZuruecksetzen(TestProvider state) {

    setState(() {
      for (var obj in state.listi) {
        obj.statistik[0] = 0;
        obj.statistik[1] = 0;
      }
    });
  }
}

