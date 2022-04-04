import 'importe.dart';

class NeuesThemaErstellen extends StatefulWidget {
  const NeuesThemaErstellen({Key? key}) : super(key: key);

  @override
  State<NeuesThemaErstellen> createState() => _NeuesThemaErstellenState();
}

class _NeuesThemaErstellenState extends State<NeuesThemaErstellen> {

  Icon defaultIcon = Icon(Icons.question_mark);
  var controllerTitel = TextEditingController();

  Color currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {

    var state = context.watch<TestProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Thema hinzufügen"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Flexible(
            flex: 3,
            child: SizedBox(
              height: 200,
              child: Container(
                color: currentColor,
                child: Center(
                  child: defaultIcon,
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => iconWaehlen(),
                child: const Text("Icon wählen"),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => farbeWaehlen(context),
                child: const Text("Farbe wählen"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              controller: controllerTitel,
              obscureText: false,
              decoration: const InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(),
                labelText: 'Titel eingeben',
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () => themaErstellen(state),
                child: const Text("Thema erstellen"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void iconWaehlen() async {
    IconData? iconAusgewaehlt = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    setState(() {
      defaultIcon = Icon(iconAusgewaehlt);
    });
  }
  Widget colorAuswaehlwerkzeug() {
    return ColorPicker(
      pickerColor: currentColor,
      onColorChanged: (color) => setState(() {
        currentColor = color;
      }),
    );
  }

  void farbeWaehlen(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Farbe waehlen"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            colorAuswaehlwerkzeug(),
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Farbe auswaehlen"))
          ],
        ),
      )
    );
  }

  void themaErstellen(TestProvider state) {
    state.updateListi(controllerTitel.text, defaultIcon, currentColor, [], [0,0],);
    Navigator.pop(context);
  }

}
