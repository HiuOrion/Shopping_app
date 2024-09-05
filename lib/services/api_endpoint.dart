class ApiEndPoint{
  static final String baseUrl = 'https://groceries-production.up.railway.app/api/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}
class _AuthEndPoints{
  final String registerEmail = 'v1/auth/register';
  final String loginEmail = 'v1/auth/login';
}