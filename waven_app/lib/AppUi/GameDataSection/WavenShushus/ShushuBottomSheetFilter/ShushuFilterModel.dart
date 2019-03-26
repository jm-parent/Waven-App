

class ShushuFilterModel {
  final String godName;
  final bool isShow;

  ShushuFilterModel(this.godName, this.isShow);

  @override
  String toString() {
    return 'ShushuFilterModel{godName: $godName, isShow: $isShow}';
  }
}

class ShushuSwitchModel {
  bool iopSW;
  bool sramSW;
  bool xelorSW;
  bool osaSW;

  ShushuSwitchModel(this.iopSW, this.sramSW, this.xelorSW, this.osaSW);

  @override
  String toString() {
    return '$iopSW;$sramSW;$xelorSW;$osaSW';
  }

  void fromString(String str) {
    var splittedString = str.split(';');

    iopSW = splittedString[0].toLowerCase() == 'true';
    sramSW = splittedString[1].toLowerCase() == 'true';
    xelorSW = splittedString[2].toLowerCase() == 'true';
    osaSW = splittedString[3].toLowerCase() == 'true';
  }

  void setValueByKey(String shushuKey, bool newValue) {
    if (shushuKey == 'Iop') iopSW = newValue;
    if (shushuKey == 'Sram') sramSW = newValue;
    if (shushuKey == 'Osamodas') osaSW = newValue;
    if (shushuKey == 'Xelor') xelorSW = newValue;
  }
}
