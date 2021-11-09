# clean coding

ID ile müşteri bulalım

```csharp

Customer FindCustomer(int id) {
    Customer customer = db.Customers.GetById(id);
    return customer;
}
```

Email ile de müşteriyi bulmamız gerekti.

```csharp

Customer FindCustomer(int id, string email = null) {
    Customer customer = null;
    if (email != null) {
        customer = db.Customers.Where(customer => customer.Email == email)
                    .FirstOrDefault();
    } else {
        customer = db.Customers.GetById(id);
    }

    return customer;
}
```

Telefon numarası varsa telefon numarasından müşteriyi bulalım.

```csharp
Customer FindCustomer(int id, string email = null, string phoneNumber = null) {
    Customer customer = null;

    if (phoneNumber != null) {
        customer = db.Customers.Where(customer => customer.PhoneNumber == phoneNumber)
                    .FirstOrDefault();
    } else if (email != null) {
        customer = db.Customers.Where(customer => customer.Email == email)
                    .FirstOrDefault();
    } else {
        customer = db.Customers.GetById(id);
    }

    return customer;
}
```

Akışta bir hata yaptığımızı farkettik. Telefon numarasına, sonra email, daha
sonra ise ID'ye müşteriyi bulmamız gerekiyor.

```csharp
Customer FindCustomer(int id, string email = null, string phoneNumber = null) {
    Customer customer = null;

    if (phoneNumber != null) {
        customer = db.Customers.Where(customer => customer.PhoneNumber == phoneNumber)
                    .FirstOrDefault();
        if (customer != null)
            return customer;
    }

    if (email != null) {
        customer = db.Customers.Where(customer => customer.Email == email)
                    .FirstOrDefault();
        if (customer != null)
            return customer;
    }

    customer = db.Customers.GetById(id);

    return customer;
}
```

ID ve diğer alanlar için  validasyon gerekti. ID 0'dan büyük olduğunda DB'ye gitmemiz gerekiyor.

```csharp
Customer FindCustomer(int id = 0, string email = null, string phoneNumber = null) {
    Customer customer = null;

    if (phoneNumber != null && PhoneNumber.IsValid(phoneNumber)) {
        customer = db.Customers.Where(customer => customer.PhoneNumber == phoneNumber)
                    .FirstOrDefault();
        if (customer != null)
            return customer;
    }

    if (email != null && Email.IsValid(email)) {
        customer = db.Customers.Where(customer => customer.Email == email)
                    .FirstOrDefault();
        if (customer != null)
            return customer;
    }

    if (id > 0) {
        customer = db.Customers.GetById(id);
        if (customer != null)
            return customer;
    }

    return customer;
}
```

Olası diğer senaryolar:

- kullanıcının birden fazla emaili olabilir.
- birden fazla telefon numarası olabilir.
- email, telefon numaralarını önce DB'de var mı kontrol etmek isteyebilirsiniz.
- Her durum için farklı Exception türleri fırlatmak isteyebilirsiniz.
- Metodun test edilmesi zorlaşır, her yeni parametre ve yeni bir IF dallanması, test edilmesi gereken durumu iki belki daha fazla katına çıkarır.
- yazılması gereken test sayısını artırır.
- testlerden gizlenebilen bug sayısını artırır. IF dallanmaları, testlerden kaçabilir.
- Metodun davranışını kestirmek zorlaşır. İlk önce emaile mi telefon numarasına mı?
- Hatalı parametreler gönderdiğinizde bile metodun doğru çalışması iyi değildir. t=f(x,y,z) fonksiyonunda y: x,y ve z'ye beraber bağımlı olmalı.
- bir metod tek bir işi iyi bir şekilde yapmalı.
- metodun testi tamamlandıktan sonra, geriye dönülmemeli. yeni bir istekler mümkün olduğunca yeni metotlarda yazılmalı. eski metodun değişmesi gerekiyorsa yeni testlerin yazılması gerekli.
- eklemek veya söküp yerine yenisini takmak, çoğu zaman değiştirmekten daha kolaydır.
- kolayca söküp atılabilir küçük fonksiyonlar yazın.
- devasa fonksiyonlar gayri menkul gibidir :D
