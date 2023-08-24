import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final num order;
  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: order == 1 ? const Offset(0, 0) : Offset(0, -order * 15.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : const Color(0xff1f2123),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: isInverted
                                ? const Color(0xff1f2123)
                                : Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          amount,
                          style: TextStyle(
                            color: isInverted
                                ? const Color(0xff1f2123)
                                : Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          code,
                          style: TextStyle(
                            color: isInverted
                                ? const Color(0xff1f2123)
                                : Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: const Offset(-5, 12),
                      child: Icon(
                        icon,
                        color:
                            isInverted ? const Color(0xff1f2123) : Colors.white,
                        size: 98,
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
