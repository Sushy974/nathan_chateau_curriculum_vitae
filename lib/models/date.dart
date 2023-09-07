import 'package:equatable/equatable.dart';

class Date extends Equatable {
  Date.fromDateTime(
    this.value,
  );

  Date.fromTimestamp(int? valueTimestamp) {
    value = DateTime.fromMillisecondsSinceEpoch(valueTimestamp! * 1000);
  }

  DateTime? value;

  int toTimestamp() {
    return value!.millisecondsSinceEpoch ~/ 1000;
  }

  @override
  List<Object?> get props => [value];
}
