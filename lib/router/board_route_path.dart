class BoardRoutePath {
  final String? id;
  final String mode;

  BoardRoutePath.home()
      : id = null,
        mode = 'list';

  BoardRoutePath.details(this.id) : mode = 'details';

  BoardRoutePath.create()
      : id = null,
        mode = 'create';

  BoardRoutePath.notFound()
      : id = null,
        mode = 'not-found';

  bool get isHomePage => mode == 'list';

  bool get isDetailsPage => mode == 'details';

  bool get isNotFound => mode == 'not-found';

  bool get isCreatePage => mode == 'create';
}
