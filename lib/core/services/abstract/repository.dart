abstract class Repository<T> {
  Future<T> getById(int id);
  Future<T?> getAll();
  Future<List<T>> create(T entity);
  Future<List<T>> update(T entity);
  Future<bool> delete(int id);
}
