import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/utils/utils.dart';

class EntrepriseHistoryScreen extends StatefulWidget {
  const EntrepriseHistoryScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;

  @override
  State<EntrepriseHistoryScreen> createState() =>
      _EntrepriseHistoryScreenState();
}

class _EntrepriseHistoryScreenState extends State<EntrepriseHistoryScreen> {
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now().subtract(
      const Duration(
        days: 5,
      ),
    ),
    end: DateTime.now(),
  );

  List<HistoryItemBuilder> listHistoryItems = [
    HistoryItemBuilder(
      dateTime: DateTime.now(),
      title: 'Analyse et Conception des Algorithmes',
    ),
    HistoryItemBuilder(
      dateTime: DateTime.now().subtract(const Duration(days: 05)),
      title: 'Analyse et Conception des Algorithmes',
    ),
    HistoryItemBuilder(
      dateTime: DateTime.now().subtract(const Duration(days: 05)),
      title: 'Analyse et Conception des Algorithmes',
    ),
    HistoryItemBuilder(
      dateTime: DateTime.now().subtract(const Duration(days: 05)),
      title: 'Analyse et Conception des Algorithmes',
    ),
    HistoryItemBuilder(
      dateTime: DateTime.now(),
      title: 'Analyse et Conception des Algorithmes',
    ),
    HistoryItemBuilder(
      dateTime: DateTime.now(),
      title: 'Analyse et Conception des Algorithmes',
    ),
    HistoryItemBuilder(
      dateTime: DateTime.now(),
      title: 'Analyse et Conception des Algorithmes',
    ),
  ];
  List<HistoryItemBuilder> filteredHistoryItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            // color: Colors.white,
          ),
        ),
        title: const Text(
          'Historique',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/category.2.svg',
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GroupedListView<HistoryItemBuilder, DateTime>(
              elements: filteredHistoryItem.isNotEmpty
                  ? filteredHistoryItem
                  : listHistoryItems,
              groupBy: (historyItem) => DateTime(
                historyItem.dateTime.year,
                historyItem.dateTime.month,
                historyItem.dateTime.day,
              ),
              // groupSeparatorBuilder: (String groupByValue) =>
              //     Text(groupByValue),
              groupHeaderBuilder: (HistoryItemBuilder historyItem) => Container(
                height: 30.0,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                alignment: Alignment.center,
                child: Text(
                  DateFormat.yMMMMEEEEd().format(historyItem.dateTime),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              itemBuilder: (context, HistoryItemBuilder historyItem) =>
                  Container(
                height: 60.0,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: primaryColor.withOpacity(.15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      '___Document Imprimé___',
                      style: TextStyle(
                        fontSize: 08,
                      ),
                    ),
                    Text(
                      historyItem.title,
                      // textScaleFactor: 1.25,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // itemComparator: (item1, item2) =>
              //     item1['name'].compareTo(item2['name']), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.DESC, // optional),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: InkWell(
              onTap: () async {
                try {
                  final DateTimeRange? date = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2022),
                    lastDate: DateTime.now(),
                    initialEntryMode: DatePickerEntryMode.input,
                    initialDateRange: dateTimeRange,
                  );
                  setState(() {
                    dateTimeRange = date!;
                    for (var element in listHistoryItems) {
                      if (element.dateTime.isBefore(dateTimeRange.start)) {
                        filteredHistoryItem.add(element);
                      }
                    }
                  });
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryItemBuilder {
  final DateTime dateTime;
  final String title;

  const HistoryItemBuilder({
    Key? key,
    required this.dateTime,
    required this.title,
  });
}
