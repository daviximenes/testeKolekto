@isTest
public class ContactTestBuilder implements ITestBuilder
{
    private Contact record;

    public ContactTestBuilder()
    {
        record = new Contact();
    }

    public static ContactTestBuilder build()
    {
        return new ContactTestBuilder();
    }

    public Contact persist()
    {
        insert record;
        return record;
    }

    public ContactTestBuilder isDefault()
    {
        this.isDefault('de Aquino','5585999999999','testeKolekto@test.com');
        return this;
    }

    public ContactTestBuilder isDefault(String lName, String phone, String email)
    {
        record.RecordTypeId = ContactsSelector.RECORDTYPE_DEFAULT;
        record.LastName = lName;
        record.Phone = phone;
        record.Email = email;
        return this;
    }
}
