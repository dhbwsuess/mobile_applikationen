import 'importe.dart';

class Quiz extends StatefulWidget {
  final Themen thema;
  const Quiz ({Key? key, required this.thema}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {

    var state = context.watch<TestProvider>();
    String tag = widget.thema.titel;

    return Scaffold(
      appBar: AppBar(
        title: Text(tag),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [Hero(
          tag: tag,
          child: Flexible(
            flex: 3,
            child: SizedBox(
              height: 200,
              child: Container(
                color: widget.thema.farbe,
                child: Center(
                  child: widget.thema.icon,
                ),
              ),
            ),
          ),
        ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Abfrage(thema: widget.thema),
                  ),
                ),
                child: const Text("Quiz starten"),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fragen(thema: widget.thema),
                  ),
                ),
                child: const Text("Frage hinzufügen"),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatistikThema(thema: widget.thema),
                  ),
                ),
                child: const Text("Statistik einsehen"),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => pickIcon(state),
                child: const Text("Icon ändern"),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => farbeWaehlen(context, state),
                child: const Text("Farbe ändern"),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => themaLoeschen(state, widget.thema),
                child: const Text("Thema löschen"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickIcon(TestProvider state) async {
    IconData? iconAusgewaehlt = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    widget.thema.icon = Icon(iconAusgewaehlt);
    state.updateProvider();
  }

  void themaLoeschen(TestProvider state, Themen thema) {
    Navigator.pop(context);
    state.listi.removeWhere((element) => element == thema);
    state.updateProvider();
  }

  Widget colorAuswaehlwerkzeug() {
    return ColorPicker(
      pickerColor: widget.thema.farbe,
      onColorChanged: (color) => setState(() {
        widget.thema.farbe = color;
      }),
    );
  }

  void farbeWaehlen(BuildContext context, TestProvider state) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Farbe waehlen"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          colorAuswaehlwerkzeug(),
          TextButton(onPressed: () => farbeSchliessenUndUpdaten(state), child: Text("Farbe auswaehlen"))
        ],
      ),
    )
    );
  }

  void farbeSchliessenUndUpdaten(TestProvider state) {
    Navigator.pop(context);
    state.updateProvider();
  }

}
