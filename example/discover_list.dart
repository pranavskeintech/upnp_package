import "package:upnp/upnp.dart";
import 'dart:async';
main() async {
  var disc = new DeviceDiscoverer();
  await disc.start(ipv6: false);
  disc.quickDiscoverClients().listen((client) async {
    try {
      var dev = await (client.getDevice() as FutureOr<Device>);
      print("${dev.friendlyName}: ${dev.url}");
    } catch (e, stack) {
      print("ERROR: ${e} - ${client.location}");
      print(stack);
    }
  });
}
