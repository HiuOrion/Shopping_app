class ApiEndPoint{
  static const String baseUrl = 'https://backendgrocery-production.up.railway.app/api/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}
class _AuthEndPoints{

  final String registerEmail = 'v1/auth/register';

  final String loginEmail = 'v1/auth/login';

  final String category = 'v1/category/get-all';

  String productByCategory(int categoryId) => 'v1/product/product-by-category/$categoryId';

  String productDetail(int productId) => 'v1/product/edit/$productId';

  String updateFavoriteProduct(int productId) => 'v1/user/favourite/$productId';

  final String favoriteProduct = 'v1/product/list-favorite';

  final String account = 'v1/user/profile';

  final String logout = 'v1/auth/logout';

  final String checkout = 'v1/payment/create-payment';

  final String topProduct= 'v1/dashboard/top-product';

  String findProductByCategory(int categoryId, String nameProduct) =>
      'v1/product/product-by-category/$categoryId?per_page=10&page=1&keyword=$nameProduct';
}