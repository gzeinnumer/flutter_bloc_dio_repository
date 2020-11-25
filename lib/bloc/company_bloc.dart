import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_repository/model/CompaniesResponse.dart';
import 'package:flutter_bloc_dio_repository/repository/company_repository.dart';
import 'package:flutter_bloc_dio_repository/bloc/company_event.dart';
import 'package:flutter_bloc_dio_repository/bloc/company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyRepository repository = CompanyRepository();

  @override
  CompanyState get initialState => CompanyInitial();

  @override
  Stream<CompanyState> mapEventToState(CompanyEvent event) async* {
    if (event is FetchCompanies) {
      yield CompanyLoadInProgress();
      try {
        final CompaniesResponse response = await repository.getCompanies();
        yield CompanyLoadSuccess(companies: response);
      } catch (_) {
        yield CompanyLoadFailure();
      }
    }
  }
}