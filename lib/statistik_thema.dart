import 'importe.dart';

class StatistikThema extends StatefulWidget {

  final Themen thema;
  const StatistikThema({Key? key, required this.thema}) : super(key: key);

  @override
  _StatistikThemaState createState() => _StatistikThemaState();
}

class _StatistikThemaState extends State<StatistikThema> {
  @override
  Widget build(BuildContext context) {

    var richtig = widget.thema.statistik[0];
    var falsch = widget.thema.statistik[1];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Deine Statistik"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Anzahl richtiger Antworten: $richtig"),
            Text("Anzahl falscher Antworten: $falsch"),
            ElevatedButton(
                onPressed: () => statistikZuruecksetzen(),
                child: const Text("Statistik zurücksetzen"))
          ],
        ),
      ),
    );
  }

  void statistikZuruecksetzen() {

    setState(() {
      widget.thema.statistik[0] = 0;
      widget.thema.statistik[1] = 0;
    });
  }
}
