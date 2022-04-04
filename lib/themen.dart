import 'importe.dart';

class Themen {
  Themen(this.titel, this.icon, this.farbe, this.fragen, this.statistik);

  String titel;
  Icon icon;
  Color farbe;
  List fragen;
  List statistik;
  bool quizAngefangen = false;

  Widget widgetErstellen() {
    return Item(thema: this);
  }

  Widget quizErstellen() {
    return Quiz(thema : this);
  }
}