import 'package:flutter_bloc_dio_repository/model/CompaniesResponse.dart';

import 'company_api_provider.dart';

class CompanyRepository {
  CompanyApiProvider _apiProvider = CompanyApiProvider();

  Future<CompaniesResponse> getCompanies() {
    return _apiProvider.getCompanies();
  }
}