class GSTEntity {
  GSTEntity({
    this.gstin,
    this.tradeName,
    this.address,
    this.additionalAddress,
    this.constitution,
    this.stateJurisdiction,
    this.centerJurisdiction,
    this.txpType,
    this.status,
    this.dtReg,
    this.dtCancel,
  });

  final String? gstin;
  final String? tradeName;
  final String? address;
  final String? additionalAddress;
  final String? constitution;
  final String? stateJurisdiction;
  final String? centerJurisdiction;
  final String? txpType;
  final String? status;
  final String? dtReg;
  final String? dtCancel;

  factory GSTEntity.fromJson(Map<String, dynamic> map) {
    return GSTEntity(
      gstin: map['gstin'],
      tradeName: map['tradeName'],
      address: map['address'],
      additionalAddress: map['additionalAddress'],
      constitution: map['constitution'],
      stateJurisdiction: map['stateJurisdiction'],
      centerJurisdiction: map['centerJurisdiction'],
      txpType: map['txpType'],
      status: map['status'],
      dtReg: map['dtReg'],
      dtCancel: map['dtCancel'],
    );
  }
}
