import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kalog_batangan_app/features/evac_centers/evac_center_controller.dart';
import 'package:kalog_batangan_app/models/evac_center.dart';
import 'package:kalog_batangan_app/widgets/primary_button.dart';

class EvacuationCenterMapPage extends ConsumerWidget {
  const EvacuationCenterMapPage({super.key});
  static get routeName => 'evac_center_map';
  static get routeLocation => '/evac_center_map';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evacCenterRef = ref.watch(evacCenterStateProvider);
    // final EvacCenterModel? selectedCenter =
    //     ref.watch(evacCenterStateProvider.notifier).selectedCenter;
    return evacCenterRef.maybeWhen(
        loading: () => Center(child: CircularProgressIndicator()),
        data: (centers, selectedCenter) => Scaffold(
              body: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.hybrid,
                    minMaxZoomPreference: MinMaxZoomPreference(10, null),
                    initialCameraPosition:
                        CameraPosition(target: LatLng(13.8958538, 121.1029007)),
                    markers: centers
                        .map((center) => Marker(
                            markerId: MarkerId(center.evacCenterName!),
                            position: LatLng(center.location!.latitude,
                                center.location!.longitude),
                            icon: ref
                                .read(evacCenterStateProvider.notifier)
                                .marker,
                            onTap: () {
                              print('test');
                              ref
                                  .read(evacCenterStateProvider.notifier)
                                  .setSelectedCenter(center);
                            }))
                        .toSet(),
                  ),
                  if (selectedCenter != null)
                    SafeArea(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  selectedCenter.evacCenterName!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                PrimaryButton(
                                  title: 'See Directions',
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )),
                    ),
                ],
              ),
            ),
        orElse: () => SizedBox.shrink());
  }
}
