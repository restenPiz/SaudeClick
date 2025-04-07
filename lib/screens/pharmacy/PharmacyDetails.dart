import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacyDetails extends StatefulWidget {
  const PharmacyDetails({super.key});

  @override
  State<PharmacyDetails> createState() => _PharmacyDetailsState();
}

class _PharmacyDetailsState extends State<PharmacyDetails> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GFBottomSheetController _controller = GFBottomSheetController();
  late GoogleMapController mapController; // Controlador do mapa
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    // Definindo a posição inicial do mapa (exemplo com coordenadas de Maputo, Moçambique)
    _initialCameraPosition = const CameraPosition(
      target: LatLng(-25.968, 32.589), // Defina as coordenadas da farmácia
      zoom: 14.0, // Nível de zoom
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //?Main Content
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Voltar para a tela anterior
                  },
                ),
                title: const Text(
                  "Ola Mauro Peniel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 500,
                  height: 400,
                  margin: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/back3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Farmacia Tuia',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.',
                textAlign: TextAlign.justify,
              ),
              //?Start with the google Map
            ],
          ),
        ),
      ),
      bottomSheet: GFBottomSheet(
        controller: _controller,
        maxContentHeight: 800, // Ajuste o valor para caber o mapa
        stickyHeaderHeight: 100,
        stickyHeader: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)],
          ),
          child: const GFListTile(
            avatar: GFAvatar(
              backgroundImage: AssetImage('assets/image_here'),
            ),
            titleText: 'Farmácia Tuia',
            subTitleText: 'Localização da Farmácia',
          ),
        ),
        contentBody: Container(
          height: 300, // Tamanho do mapa no bottomSheet
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: {
              const Marker(
                markerId: MarkerId('farmaciaMarker'),
                position: LatLng(-25.968, 32.589), // Coordenadas da farmácia
                infoWindow: InfoWindow(
                  title: 'Farmácia Tuia',
                  snippet: 'Descrição da farmácia',
                ),
              ),
            },
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            myLocationEnabled: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: GFColors.SUCCESS,
        child: _controller.isBottomSheetOpened
            ? const Icon(Icons.keyboard_arrow_down)
            : const Icon(Icons.keyboard_arrow_up),
        onPressed: () {
          _controller.isBottomSheetOpened
              ? _controller.hideBottomSheet()
              : _controller.showBottomSheet();
        },
      ),
    );
  }
}
