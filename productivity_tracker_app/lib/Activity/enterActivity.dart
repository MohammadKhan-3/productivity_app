import 'package:flutter/material.dart';
import 'package:productivity_tracker_app/Activity/activityForm.dart';
import 'package:productivity_tracker_app/main.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

  static const String _title = 'Log Activity';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String dropdownValue = 'A'; // should replace with stored values in firebase
  DateTime startTime = DateTime(2022, 5, 24, 5, 17);
  TimeOfDay time = TimeOfDay.now();
  DateTime endTime = DateTime(2022, 5, 24, 6, 45);

  @override
  Widget build(BuildContext context) {
    // For display below
    final startHours = startTime.hour.toString().padLeft(2, '0');
    final startMinutes = startTime.minute.toString().padLeft(2, '0');

    final endHours = endTime.hour.toString().padLeft(2, '0');
    final endMinutes = endTime.minute.toString().padLeft(2, '0');

    // For calculating Duration
    final startHour = startTime.hour;
    final startMinute = startTime.minute;
    final endHour = endTime.hour;
    final endMinute = endTime.minute;

    // Duration hoursDiff = startHour.difference(endHour);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Activity'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text('Choose Start Date/Time'),
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: pickDateTime,
                    child: Text(
                        '${startTime.month}/${startTime.day}/${startTime.year} $startHours:$startMinutes'),
                  ),
                  const SizedBox(height: 15.0),
                  const Text('Choose End Date/Time'),
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: pickEndDateTime,
                    child: Text(
                        '${endTime.month}/${endTime.day}/${endTime.year} $endHours:$endMinutes'),
                  ),
                  // Expanded(
                  //   child: ElevatedButton(
                  //     child: Text('$startHours:$startMinutes'),
                  //     onPressed: () async {
                  //       final time = await pickTime();

                  //       if (time == null) return; //press cancel

                  //       final newStartTime = DateTime(
                  //         startTime.year,
                  //         startTime.month,
                  //         startTime.day,
                  //         time.hour,
                  //         time.minute,
                  //       );
                  //       setState(() => startTime = newStartTime);
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Enter Category',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 32.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (value) {
                      //Do something with this value
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Enter Activity',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 32.0),
                            borderRadius: BorderRadius.circular(5.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (value) {
                      //Do something with this value
                    },
                  ),
                  // DropDown Button Implementation
                  // const SizedBox(height: 10.0),
                  // const Text('DropDown Button'),
                  // const SizedBox(height: 10.0),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(3.0)),
                  //   child: DropdownButton<String>(
                  //     value: dropdownValue,
                  //     isExpanded: true,
                  //     icon: const Icon(Icons.keyboard_arrow_down, size: 22),
                  //     underline: const SizedBox(),
                  //     items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(value),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       //Do something with this value
                  //       setState(() {
                  //         dropdownValue = 'value';
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ))),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            const Spacer(),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; // pressed cancel

    TimeOfDay? time = await pickTime();
    if (time == null) return; //pressed cancel

    final startTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => this.startTime = startTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: startTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: startTime.hour, minute: startTime.minute));

  Future pickEndDateTime() async {
    DateTime? date = await pickEndDate();
    if (date == null) return; // pressed cancel

    TimeOfDay? time = await pickEndTime();
    if (time == null) return; //pressed cancel

    final endTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => this.endTime = endTime);
  }

  Future<DateTime?> pickEndDate() => showDatePicker(
        context: context,
        initialDate: endTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickEndTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: endTime.hour, minute: endTime.minute));
}
