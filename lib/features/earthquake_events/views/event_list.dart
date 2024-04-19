import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';

class EventList extends ConsumerWidget {
  const EventList({required this.events, super.key});
  final List<EarthquakeEventModel> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: events.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // return Text('bobo');
          return eventItem(events[index]);
        });
  }

  Widget eventItem(EarthquakeEventModel event) {
    final locationSplit = event.location!.split('of');

    final String damage = event.expectDamage! == "NO"
        ? 'Not expecting any damage'
        : 'Expecting serious damage';
    final String aftershocks = event.expectAfterShocks! == "NO"
        ? 'Not expecting any aftershocks'
        : 'Prepare for possible aftershocks';
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green,
          border: Border.all(color: Colors.green, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  locationSplit[1],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  event.magnitude ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  damage,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  aftershocks,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    event.time ?? '',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
