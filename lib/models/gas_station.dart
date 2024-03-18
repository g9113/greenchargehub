import 'package:latlong2/latlong.dart';

class GasStation {
  final LatLng location;
  final String address, image, name,adminid;
  final double price;

  GasStation(
      {required this.image,
      required this.name,
      required this.price,
      required this.address,
      required this.location,
      required this.adminid});
}

List<GasStation> gasStations = [
  GasStation(
    name: 'EV Charging Station (HP)',
    adminid: "1",
    location: const LatLng(19.2102, 73.0806),
    image:
        'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202309/l-intro-1645632067-sixteen_nine-sixteen_nine.jpg',
    price: 4,
    address: 'Dombivli East, Dombivli, Maharashtra, India',
  ),
  GasStation(
    name: 'EV Charging Station (BPCL)',
    adminid: "2",
    location: const LatLng(19.2109, 73.0910),
    image:
        'https://imgd.aeplcdn.com/1280x720/n/cw/ec/164625/right-front-three-quarter0.jpeg',
    price: 5,
    address: 'Ramnagar, Dombivli, Maharashtra, India',
  ),
  GasStation(
    name: 'EV Charging Station (Indian Oil)',
    adminid: "3",
    location: const LatLng(19.2145, 73.0863),
    image:
        'https://www.greentechmedia.com/assets/content/cache/made/assets/content/cache/remote/https_assets.greentechmedia.com/content/images/articles/Gridserve-EF-Braintree-_electric_vehicle_xl_credit_gridserve_721_420_80_s_c1.jpg',
    price: 3,
    address: 'Thakurli, Dombivli, Maharashtra, India',
  ),
  GasStation(
    name: 'EV Charging Station (Reliance)',
    adminid: "4",
    location: const LatLng(19.2157, 73.0977),
    image:
        'https://assets.canarymedia.com/content/uploads/NYPA-booth-copy-2.jpeg',
    price: 6,
    address: 'Dombivli West, Dombivli, Maharashtra, India',
  ),
  GasStation(
    name: 'EV Charging Station (Essar)',
    adminid: "5",
    location: const LatLng(19.2134, 73.0839),
    image:
        'https://www.assemblymag.com/ext/resources/Issues/2021/September/charging/aem0921production3.jpg',
    price: 10,
    address: 'Gandhi Nagar, Dombivli, Maharashtra, India',
  ),
  GasStation(
    name: 'EV Charging Station (Shell)',
    adminid: "6",
    location: const LatLng(19.2096, 73.0793),
    image:
        'https://cdn.whichcar.com.au/assets/p_16x9/ae89096a/tesla-model-3-fast-charger.jpg',
    price: 20,
    address: 'Dombivli Railway Station, Dombivli, Maharashtra, India',
  ),
];
