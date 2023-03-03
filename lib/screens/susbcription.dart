import 'package:flutter/material.dart';
import 'package:ui_event_app/components/wrapperprofile.dart';
import 'package:ui_event_app/constants/constant.dart';
import 'package:ui_event_app/screens/event_list.dart';
import 'package:ui_event_app/services/apiServices.dart';
import 'package:ui_event_app/utils/app_func.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart';

class Susbcription extends StatefulWidget {
  const Susbcription({Key? key}) : super(key: key);

  @override
  State<Susbcription> createState() => _SusbcriptionState();
}

class _SusbcriptionState extends State<Susbcription> {
  @override
  Widget build(BuildContext context) {
    return WrapperProfile(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                // navigateToNextPage(context, PaiementPage());
                final kkiapay = KKiaPay(
                    amount: 10000,
                    countries: ["BJ"],
                    phone: "22961000000",
                    name: "GUEDJE Prince Gédéon",
                    email: "email@mail.com",
                    reason: 'Evenement',
                    data: 'Fake data',
                    sandbox: true,
                    apikey: 'd02e092072ad11edafdd9bfe995c3ca5',
                    callback: (response, context) {
                      ApiServices.passtopremium();
                      ApiServices.getUser();
                      navigateToNextPage(context, EventList(), back: false);
                      toast("Vous êtes passé premium");
                    },
                    theme: "#222F5A",
                    partnerId: 'AxXxXXxId',
                    paymentMethods: ["momo", "card"]);

                navigateToNextPage(context, kkiapay);
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Abonnement Premium 1 mois",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "10.000f",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.ac_unit_sharp,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                // navigateToNextPage(context, PaiementPage());
                final kkiapay = KKiaPay(
                    amount: 10000,
                    countries: ["BJ"],
                    phone: "22961000000",
                    name: "GUEDJE Prince Gédéon",
                    email: "email@mail.com",
                    reason: 'Evenement',
                    data: 'Fake data',
                    sandbox: true,
                    apikey: 'd02e092072ad11edafdd9bfe995c3ca5',
                    callback: (response, context) {
                      ApiServices.passtopremium();
                      Navigator.pop(context);
                    },
                    theme: "#222F5A",
                    partnerId: 'AxXxXXxId',
                    paymentMethods: ["momo", "card"]);

                navigateToNextPage(context, kkiapay);
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "Abonnement Premium 2 mois",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "20.000f",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.ac_unit_sharp,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 145,
          ),
        ],
      ),
    ));
  }
}
