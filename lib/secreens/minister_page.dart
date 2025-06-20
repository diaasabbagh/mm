import 'package:flutter/material.dart';
import 'package:flutter_application_eyman/constant/color.dart';
import 'package:flutter_application_eyman/constant/image.dart';
import 'package:flutter_application_eyman/models/education_model.dart';
import 'package:flutter_application_eyman/widgets/certificate_tab.dart';

class CertificateDashboard extends StatefulWidget {
  const CertificateDashboard({super.key});

  @override
  State<CertificateDashboard> createState() => _CertificateDashboardState();
}

class _CertificateDashboardState extends State<CertificateDashboard> {
  List<String> academicYears = [
    "2024 - 2025",
    "2023 - 2024",
    "2022 - 2023",
  ];
  String selectedYear = "2024 - 2025";

  List<Certificate> certificates = [
    Certificate(
      name: "Intermediate Certificate",
      subjects: [
        Subject(name: "Arabic Language", maxMark: 600),
        Subject(name: "Mathematics", maxMark: 400),
        Subject(name: "Biology", maxMark: 200),
        //  Subject(name: "Chemistry", maxMark: 200),
        Subject(name: "English Language", maxMark: 200),
        //  Subject(name: "French Language", maxMark: 200),
        Subject(name: "History science", maxMark: 100),
        Subject(name: "geography", maxMark: 100),
      ],
      //   color: Colors.blue,
      icon: Icons.school,
      imageAsset: AppImageAsset.basic,
    ),
    Certificate(
      name: "Religious Intermediate",
      subjects: [
        Subject(name: "Fiqh", maxMark: 200),
        Subject(name: "Hadith", maxMark: 200),
      ],
      //    color: Colors.teal,
      icon: Icons.book_online,
      imageAsset: AppImageAsset.religious,
    ),
    Certificate(
      name: "Scientific Secondary",
      subjects: [
        Subject(name: "Physics", maxMark: 90),
        Subject(name: "Chemistry", maxMark: 90),
      ],
      //   color: Colors.deepOrange,
      icon: Icons.science,
      imageAsset: AppImageAsset.scientific,
    ),
    Certificate(
      name: "Literary Secondary",
      subjects: [
        Subject(name: "Philosophy", maxMark: 400),
        Subject(name: "French Language", maxMark: 300),
      ],
      //   color: Colors.deepPurple,
      icon: Icons.menu_book,
      imageAsset: AppImageAsset.literary,
    ),
    Certificate(
      name: "Vocational Secondary",
      subjects: [
        Subject(name: "Carpentry", maxMark: 200),
        Subject(name: "Mechanics", maxMark: 300),
      ],
      //   color: Colors.green,
      icon: Icons.handyman,
      imageAsset: AppImageAsset.vocational,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: certificates.length,
      child: Scaffold(
        // داخل appBar:
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(145),
          child: AppBar(
            backgroundColor: AppColor.title,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 2, top: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(AppImageAsset.logo),
                      radius: 30,
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "🎓 Ministry of Education",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.iconColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                            DropdownButton<String>(
                              value: selectedYear,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: AppColor.iconColor),
                              elevation: 16,
                              style: const TextStyle(
                                  color: AppColor.backgroundcolor),
                              underline: Container(
                                  height: 1, color: AppColor.backgroundcolor),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedYear = newValue!;
                                });
                              },
                              items: academicYears
                                  .map<DropdownMenuItem<String>>((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year,
                                      style: const TextStyle(
                                          color: AppColor.purple)),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              labelColor: AppColor.orange,
              unselectedLabelColor: AppColor.backgroundcolor,
              //  indicatorColor: Colors.amber,
              tabs: certificates
                  .map((cert) => Tab(
                        child: Row(
                          children: [
                            Icon(cert.icon, size: 20),
                            const SizedBox(width: 5),
                            Text(cert.name),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),

        body: TabBarView(
          children: certificates.asMap().entries.map((entry) {
            final index = entry.key;
            final cert = entry.value;
            return CertificateTab(
              certificate: cert,
              onAddSubject: (subject) {
                setState(() => certificates[index].subjects.add(subject));
              },
              onEditSubject: (i, subject) {
                setState(() => certificates[index].subjects[i] = subject);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
