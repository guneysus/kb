-- TODO --

```cs
public interface IShape
{
    decimal CalculateArea();
    decimal CalculateDistance();
}


public class Rectangle : IShape
{
    decimal CalculateArea() {
      throw new NotImplementedException();
    }

    decimal CalculateDistance() {
      throw new NotImplementedException();
    }    
}

public interface ICircle : IShape
{
    decimal Radius{get;set;}
}

public class Circle : ICircle //, IShape
{
    public decimal Radius { get; set; }

    decimal CalculateArea() {
      throw new NotImplementedException();
    }

    decimal CalculateDistance() {
      throw new NotImplementedException();
    }    
}

public class Square : Rectangle
{
    decimal CalculateArea() {
      throw new NotImplementedException();
    }

    decimal CalculateDistance() {
      throw new NotImplementedException();
    }
}



public interface IDBStore
{
    void Save(object entity);
}


public class SqlServerStore : IDbStore
{
    public void Save(object entity) {
      db.Add(entity);
    }
}


public class MongoDbStore : IDbStore
{
    public Order CreateOrder(object entity) {
      var order = mongo.Insert(entity);

      if(order == null)
        throw new NotFoundException();
    }
}


public void Main () {
  IDbStore db = new SqlServerStore();
  
  var order = db.Save(rectangle1);

  return View(order);

}
// Contract
// API Contract
```

  
