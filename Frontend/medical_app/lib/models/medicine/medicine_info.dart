class MedicineInfo {
  String title;
  String description;
  MedicineType medicineType;
  int? medicine_id;
  MedicineInfo({
    required this.title,
    required this.description,
    required this.medicineType,
    this.medicine_id,
  });

  get medicine_image {
    if (medicineType == MedicineType.cream) {
      return 'Assets/svg/cream.svg';
    } else if (medicineType == MedicineType.pills) {
      return 'Assets/svg/pills.svg';
    } else if (medicineType == MedicineType.syring) {
      return 'Assets/svg/syringe.svg';
    } else if (medicineType == MedicineType.syrup) {
      return 'Assets/svg/syrup.svg';
    }
  }
}

enum MedicineType { pills, syrup, cream, syring }
