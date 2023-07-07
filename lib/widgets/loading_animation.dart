import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics:  const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.indigoAccent,
                highlightColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: 50,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}