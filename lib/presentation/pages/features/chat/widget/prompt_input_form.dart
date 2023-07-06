import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:titip_itinerary_planner/presentation/utils/constants.dart';
import 'package:titip_itinerary_planner/presentation/utils/custom_color.dart';

class PromptInputForm extends StatefulWidget {
  const PromptInputForm({super.key});

  @override
  State<PromptInputForm> createState() => _PromptInputFormState();
}

class _PromptInputFormState extends State<PromptInputForm> {
  final _destinationController = TextEditingController();
  final _travellerController = TextEditingController();
  final _otherInformationController = TextEditingController();

  DateTimeRange? selectedDateTimeRange;
  int duration = 7;

  String convertToPromptMessage() {
    return "$firstChatHeader ${_destinationController.text} ${selectedDateTimeRange == null ? "" : "from ${DateFormat('d MMMM yyyy').format(selectedDateTimeRange!.start)} to ${DateFormat('d MMMM yyyy').format(selectedDateTimeRange!.end)} for ${duration} days"}";
  }

  void submit() {
    print(convertToPromptMessage());
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _travellerController.dispose();
    _otherInformationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fieldTitleStyle = Theme.of(context).textTheme.labelLarge;
    final fieldTitleOptionalStyle =
        Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            );
    final fieldHintStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black38);
    final textFieldTextStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87);

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(firstChatHeader),
          SizedBox(height: 8),
          Text(
            "Destination",
            style: fieldTitleStyle,
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: _destinationController,
            style: textFieldTextStyle,
            decoration: InputDecoration(
              isDense: true,
              hintText: "Country, Region, Cities, etc.",
              border: InputBorder.none,
              hintStyle: fieldHintStyle,
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Date",
                style: fieldTitleStyle,
              ),
              Text(
                " (optional)",
                style: fieldTitleOptionalStyle,
              ),
            ],
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: () async {
              final dateRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 3650)));
              if (dateRange != null) {
                setState(() {
                  selectedDateTimeRange = dateRange;
                  duration = selectedDateTimeRange!.duration.inDays;
                });
              }
            },
            child: TextFormField(
              style: textFieldTextStyle,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_month),
                isDense: true,
                hintText: selectedDateTimeRange == null
                    ? "Click to pick date"
                    : "${DateFormat('d MMM yyyy').format(selectedDateTimeRange!.start)} - ${DateFormat('d MMM yyyy').format(selectedDateTimeRange!.end)}",
                border: InputBorder.none,
                hintStyle: selectedDateTimeRange == null
                    ? fieldHintStyle
                    : textFieldTextStyle?.copyWith(fontSize: 13),
                fillColor: Colors.white,
                filled: true,
              ),
              enabled: false,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Duration",
            style: fieldTitleStyle,
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: selectedDateTimeRange != null || duration <= 1
                    ? null
                    : () => setState(() => duration -= 1),
                icon: Icon(Icons.remove),
              ),
              Text(
                "${duration}",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              IconButton(
                  onPressed: selectedDateTimeRange != null
                      ? null
                      : () => setState(() => duration += 1),
                  icon: Icon(Icons.add)),
              Text(" days")
            ],
          ),
          Row(
            children: [
              Text(
                "Traveller",
                style: fieldTitleStyle,
              ),
              Text(
                " (optional)",
                style: fieldTitleOptionalStyle,
              ),
            ],
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: _travellerController,
            style: textFieldTextStyle,
            decoration: InputDecoration(
              isDense: true,
              hintText: "e.g. I'm travelling solo",
              border: InputBorder.none,
              hintStyle: fieldHintStyle,
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            children: [
              Text(
                "Other Information/Request",
                style: fieldTitleStyle,
              ),
              Text(
                " (optional)",
                style: fieldTitleOptionalStyle,
              ),
            ],
          ),
          SizedBox(height: 4),
          TextFormField(
            controller: _otherInformationController,
            style: textFieldTextStyle,
            maxLines: 3,
            decoration: InputDecoration(
              isDense: true,
              hintText:
                  "e.g. I prefer nature over cities. Answer in Bahasa Indonesia.",
              border: InputBorder.none,
              hintStyle: fieldHintStyle,
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: travelokaBlue),
                onPressed: _destinationController.text.isNotEmpty
                    ? () => submit()
                    : null,
                child: Text(
                  "SUBMIT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
