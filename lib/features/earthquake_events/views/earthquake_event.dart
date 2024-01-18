import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalog_batangan_app/features/earthquake_events/earthquake_event_controller.dart';
import 'package:kalog_batangan_app/features/earthquake_events/views/event_list.dart';
import 'package:kalog_batangan_app/source/phivolcs_data_scrape.dart';
import 'package:kalog_batangan_app/widgets/appbar.dart';

class EarthquakeEventPage extends ConsumerWidget {
  const EarthquakeEventPage({super.key});
  static get routeName => 'earthquake_event';
  static get routeLocation => '/earthquake_event';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Todays Events',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer(builder: (context, watch, child) {
              final eventState = ref.watch(earthquakeEventsNotifierProvider);
              return eventState.maybeWhen(
                  data: (earthquakeEvents) {
                    print(earthquakeEvents);
                    if (earthquakeEvents.isEmpty) {
                      return const Center(
                        child: Text(
                          'No events for today',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black45),
                        ),
                      );
                    }
                    // return Text('pangit');
                    return EventList(events: earthquakeEvents);
                  },
                  error: (message) => Text('message'),
                  loading: () => CircularProgressIndicator(),
                  orElse: () => SizedBox.shrink());
            }),
          )
        ],
      ),
    );
  }
}
