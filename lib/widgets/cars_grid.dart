import 'package:flutter/material.dart';
import 'package:rent_car_app/mdls/cars.dart';
import '../screens/car_detail.dart';

class CarsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCars.cars.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CarDetail(
                      title: allCars.cars[i].title,
                      brand: allCars.cars[i].brand,
                      fuel: allCars.cars[i].fuel,
                      price: allCars.cars[i].price,
                      path: allCars.cars[i].path,
                      gearbox: allCars.cars[i].gearbox,
                      color: allCars.cars[i].color,
                    )));
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: i.isEven ? 0 : 20, bottom: i.isEven ? 20 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  //color: Theme.of(context).primaryColor,
                color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 8, spreadRadius: 0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: allCars.cars[i].title,
                        child: Image.asset(allCars.cars[i].path, height: 118,)),
                    Text(
                      allCars.cars[i].title,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'BDT',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        //SizedBox(width: 10),
                        Text(
                          (allCars.cars[i].price).toString(),),
                      ],
                    ),
                   //Text('per month')
                  ],
                ),
              )),
        ),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
