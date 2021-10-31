import 'dart:developer';

import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late TextEditingController _cityNameController;

  @override
  void initState() {
    super.initState();
    _cityNameController = TextEditingController();
  }

  @override
  void dispose() {
    _cityNameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _cityNameController,
                    onChanged: (value) {
                    },
                    cursorColor: Colors.blueGrey,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Введите название города',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: '[на английском]',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black87,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none),
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.black87,
                          size: 50,
                        )),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  log(_cityNameController.value.text);
                  Navigator.pop(context, _cityNameController.value.text);
                },
                child: Text('Показать погоду', style: TextStyle(
                  fontSize: 30
                ),),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(240, 44),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                  backgroundColor: Colors.black87,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
