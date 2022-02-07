enum StatusExe { submitted, short, late, onActive}

class Exe {
  String name;
  DateTime? deadline;
  DateTime startTime;
  String giver;
  double? score;
  StatusExe status;

  Exe(this.name, this.deadline, this.startTime, this.giver, this.score,this.status);
}
