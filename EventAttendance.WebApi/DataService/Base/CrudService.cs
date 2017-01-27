using Data.Core.IEntity;
using Data.Core.IRepository;
using Data.Core.IService;
using Data.Core.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace EventAttendance.WebApi.DataService
{
    public class CrudService<T> : ICrudService<T> where T : EntityBase, new()
    {
        protected IRepository<T> repo;

        public CrudService(IRepository<T> repo)
        {
            this.repo = repo;
        }

        public IEnumerable<T> GetAll()
        {
            return repo.GetAll();
        }

        public T Get(int id)
        {
            return repo.Get(id);
        }

        public virtual int Create(T item)
        {
            if (item is IAudit)
            {
                (item as IAudit).ModifiedById = LoginInfo.UserId;
                (item as IAudit).ModifiedOn = DateTime.Now;
            }

            var newItem = repo.Insert(item);
            repo.Save();
            return ((IId)newItem).Id;
        }

        public void Save()
        {
            repo.Save();
        }

        public virtual void Delete(int id)
        {
            repo.Delete(repo.Get(id));
            repo.Save();
        }

        public void Restore(int id)
        {
            repo.Restore(repo.Get(id));
            repo.Save();
        }

        public IEnumerable<T> Where(Expression<Func<T, bool>> predicate, bool showDeleted = false)
        {
            return repo.Where(predicate, showDeleted);
        }

        public IEnumerable<T> Where(Expression<Func<T, bool>> filter, out int total, int index = 0, int size = 50)
        {
            return repo.Filter(filter, out total, index = 0, size);
        }

        public IQueryable<T> Filter(string sortFieldName, string sortDirection, bool _search, string searchField, FilterOperator searchOperator, string searchString, out int totalRecords, out int totalDisplayRecords, int currentPage = 0, int pageSize = 50)
        {
            return repo.Filter(sortFieldName, sortDirection, _search, searchField, searchOperator, searchString, out totalRecords, out totalDisplayRecords, currentPage, pageSize).AsQueryable();
        }
    }
}