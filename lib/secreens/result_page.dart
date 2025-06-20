import 'package:flutter/material.dart';
import 'package:flutter_application_eyman/constant/color.dart';
import 'package:flutter_application_eyman/constant/image.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
              child: Opacity(
            opacity: 0.4, // لتقليل حدة الصورة
            child: Image.asset(
              AppImageAsset.s,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          )),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImageAsset.logo),
                        radius: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Ministry of Education',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.purple,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.school, color: AppColor.purple, size: 20),
                    ],
                  ),
                ),
                _buildStudentInfo(),
                const SizedBox(height: 16),
                const SizedBox(height: 24),
                _buildSubjectsGrid(),
                const SizedBox(height: 24),
                _buildTotalBox(),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.backgroundcolor,
                  ),
                  label: const Text(
                    'Back to Search',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.backgroundcolor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.purple),
        borderRadius: BorderRadius.circular(12),
        color: AppColor.backgroundcolor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Table(
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
              },
              children: const [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Registration No:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '111',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Certificate:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Basic Education',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Year:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '2023 - 2024',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Governorate:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Damascus',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Full Name:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Ahmad Ali',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'School:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Al-Aman School',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Result:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Text(
                          'Passed',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
          const Icon(
            Icons.perm_contact_calendar_sharp,
            color:
                Color.fromARGB(255, 170, 175, 219), // اللون الذي تود استخدامه
            size: 180,
          ),
          // const Icon(
          //   Icons.person_pin_outlined,
          //   color: AppColor.purple, // اللون الذي تود استخدامه
          //   size: 180,
          // ),
          // const Icon(
          //   Icons.co_present_rounded,
          //   color: AppColor.purple, // اللون الذي تود استخدامه
          //   size: 160,
          // ),
        ],
      ),
    );
  }

  Widget _buildSubjectsGrid() {
    final subjects = [
      {'name': 'Arabic', 'score': 590, 'max': 600},
      {'name': 'English', 'score': 390, 'max': 400},
      {'name': 'French', 'score': 252, 'max': 300},
      {'name': 'Math', 'score': 600, 'max': 600},
      {'name': 'Science & Health', 'score': 140, 'max': 150},
      {'name': 'Religious Education', 'score': 165, 'max': 200},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: subjects.map((subject) {
        return Container(
          width: 180,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border:
                Border.all(color: AppColor.purple, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            color: AppColor.backgroundcolor,
          ),
          child: Column(
            children: [
              Text(
                subject['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Score: ${subject['score']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Max: ${subject['max']}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTotalBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.orange),
        borderRadius: BorderRadius.circular(12),
        color: AppColor.backgroundcolor,
      ),
      child: const Text(
        'Total: 2937',
        style: TextStyle(
          color: AppColor.orange,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
