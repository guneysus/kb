## Single Responsibility

```csharp
void CreateOrder(Order order) {
  orders.Add(order);
  smsService.SendSMS($"{order.Number} siparişiniz yola çıktı", 
    order.Customer.Phone);
}
```


```csharp
void CreateOrder(Order order) {
  try {
    SaveOrder(order);
      smsService.SendSMS($"{order.Number} siparişiniz yola çıktı", 
        order.Customer.Phone);
    } catch (DbException ex) {
      throw;
    } catch (SmsSendException ex) {
      throw;
    }
}
```


## Open-closed Principle

```csharp
void CreateOrder(Order order) {
  orders.Add(order);
}
```

```csharp
void CreateOrder(Order order, 
  bool notifySms = false) {
    orders.Add(order);
    if(notifySms) {
      SendSMS(…)
    }
}
```


```csharp
void CreateOrder(Order order, 
  bool notifySms = false, 
  bool notifyEmail = false) {
    orders.Add(order);
    if(notifySms) SendSMS(…);
    if(notifyEmail) SendEmail(…);
}
```

```csharp
void CreateOrder(Order order, 
  bool notifySms = false, 
  bool notifyEmail = false) {
    orders.Add(order);
    if(notifySms) SendSMS(…);
    if(notifyEmail) SendEmail(…);
}
```


## Readability

```csharp
void CreateOrder(Order order) {
  try {
SaveOrder(order);smsService.SendSMS($"{order.Number} siparişiniz yola çıktı", 
  order.Customer.Phone); } catch (DbException ex) { 
throw; } catch (SmsSendException ex) { throw;
  }
}
```



## Maintainability

```csharp

void Create(Order o) {
  try {
    Save(o);
      s.Send($"{o.Number} siparişiniz yola çıktı", 
      o.Customer.Phone); } 
    catch (DbException ex) { 
      throw; 
    } catch (SmsSendException ex) { 
        throw;
  }
}
```

## Easy To Test


```csharp
decimal CalculateLoan(decimal capital, decimal rate, int term) {
    var loan = (capital + capital * rate);

    if(term < 6 && capital >= 1000.0m)
        return loan * 0.97m;
    
    if(term < 6 && capital >= 1000.0m && capital < 5000.0m)
        return loan * 0.95m;
    
    if(term >= 6 && capital < 1000.0m )
        return loan * 0.97m * 1.10m;

    if(term >= 6 && capital >= 1000.0m)
        return loan * 1.05m;

    return loan;   
}
```

```csharp
decimal CalculateLoan(decimal capital, decimal rate, int term) {
  if (term < 6) {
    if(capital >= 1000.0m) {
      return (capital + capital * rate) * 0.97m;
    } else if (capital >= 1000.0m && capital < 5000.0m) {
        return (capital + capital * rate) * 0.95m;
    } else {
        return capital + capital * rate;
      }
   } else if ( term >=6 ) {
    if(capital < 1000.0m) {
      return (capital + capital * rate) * 0.97m * 1.10m;
    } else if (capital >= 1000)
      else {
        return (capital + capital * rate) * 1.05m;
      }
   }
}
```

