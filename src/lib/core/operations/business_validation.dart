class BusinessValidation{
  String errorKey;
  String errorMsg;

  BusinessValidation(this.errorKey, this.errorMsg);

  bool isValid() => this.errorKey == null && this.errorMsg == null;

  static BusinessValidation validBusiness() =>
      new BusinessValidation(null, null);
}