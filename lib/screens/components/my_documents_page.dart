import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/service_page.dart';
import 'package:shop_app/utils/utils.dart';

class MyDocumentsScreen extends StatelessWidget {
  const MyDocumentsScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;
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
          'Mes Documents',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            myDocumentItemBuilder(
              context,
              DocumentBuilder(
                documentTitle: 'Analyse et conception des Algorithmes',
                documentLink: 'assets/ineif/faief',
                documentCopies: 05,
                documentColorType: false,
                documentReliureType: true,
                documentdispositionType: true,
                documentSendingDate: DateTime.now(),
                documentComment: 'Ne pas imprimer la page 02',
                ownerName: 'Alhafiz',
                ownerPhone: 656541584,
                documentStatus: true,
              ),
            ),
            myDocumentItemBuilder(
              context,
              DocumentBuilder(
                documentTitle: 'Telecommunication',
                documentLink: 'assets/ineif/faief',
                documentCopies: 05,
                documentColorType: false,
                documentReliureType: false,
                documentdispositionType: true,
                documentSendingDate: DateTime.now(),
                documentComment: 'Ne pas imprimer la page 02',
                ownerName: 'Alhafiz',
                ownerPhone: 656541584,
                documentStatus: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myDocumentItemBuilder(
      BuildContext context, DocumentBuilder documentBuilder) {
    return Container(
      width: deviceSize.width,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(documentBuilder.documentTitle),
          ),
          Container(
            height: 40,
            width: 80,
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  documentBuilder.documentStatus ? Colors.green : Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              documentBuilder.documentStatus ? 'Terminé' : 'En cours',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                showDocumentDetailsDialog(context, documentBuilder);
              },
              icon: SvgPicture.asset(
                'assets/icons/show.5.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDocumentDetailsDialog(
      BuildContext context, DocumentBuilder documentBuilder) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Container(
          padding: const EdgeInsets.only(
            bottom: 5.0,
          ),
          child: const Text('Details'),
        ),
        contentPadding: const EdgeInsets.all(0),
        content: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              detailsItemBuilder(
                'Client',
                documentBuilder.ownerName,
              ),
              detailsItemBuilder(
                'Phone',
                documentBuilder.ownerPhone.toString(),
              ),
              detailsItemBuilder(
                'N. Copies',
                documentBuilder.documentCopies.toString(),
              ),
              detailsItemBuilder(
                'Couleur',
                documentBuilder.documentColorType ? 'Oui' : 'Non',
              ),
              detailsItemBuilder(
                'Reliure',
                documentBuilder.documentReliureType ? 'Oui' : 'Non',
              ),
              detailsItemBuilder(
                'Disposition',
                documentBuilder.documentdispositionType
                    ? 'Recto'
                    : 'Recto/Verso',
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 60,
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: documentBuilder.documentStatus
                    ? Colors.green
                    : Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget detailsItemBuilder(String title, String description) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                description,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
