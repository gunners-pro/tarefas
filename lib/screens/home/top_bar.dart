import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //profile
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
              SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bom dia!", style: TextStyle(color: Colors.grey[700])),
                  Text(
                    "Fabricyo Barreto",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //settings/notification
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none, size: 26),
                onPressed: () {},
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.settings_outlined, size: 26),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
