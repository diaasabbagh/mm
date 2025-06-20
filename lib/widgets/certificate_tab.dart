import 'package:flutter/material.dart';
import 'package:flutter_application_eyman/constant/color.dart';
import 'package:flutter_application_eyman/models/education_model.dart';
import 'package:flutter_application_eyman/widgets/subject_dialog.dart';

class CertificateTab extends StatelessWidget {
  final Certificate certificate;
  final Function(Subject) onAddSubject;
  final Function(int, Subject) onEditSubject;

  const CertificateTab({
    super.key,
    required this.certificate,
    required this.onAddSubject,
    required this.onEditSubject,
  });

  int get totalMarks =>
      certificate.subjects.fold(0, (sum, subj) => sum + subj.maxMark);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              certificate.imageAsset,
              fit: BoxFit.cover, // يجعل الصورة تغطي كامل الخلفية بدون قص
              alignment: Alignment.center,
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: certificate.subjects.length,
                itemBuilder: (context, index) {
                  final subject = certificate.subjects[index];
                  return Card(
                    elevation: 7,
                    color: AppColor.backgroundcolor,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.purple,
                        child: Text(subject.maxMark.toString()),
                      ),
                      title: Text(subject.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          final edited = await showDialog<Subject>(
                            context: context,
                            builder: (context) =>
                                SubjectDialog(subject: subject),
                          );
                          if (edited != null) {
                            onEditSubject(index, edited);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final newSubject = await showDialog<Subject>(
                        context: context,
                        builder: (context) => const SubjectDialog(),
                      );
                      if (newSubject != null) {
                        onAddSubject(newSubject);
                      }
                    },
                    icon: const Icon(Icons.add_circle_outline,
                        size: 28, color: AppColor.backgroundcolor),
                    label: const Text(
                      "Add Subject",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.backgroundcolor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: AppColor.purple.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Total Marks: $totalMarks",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
