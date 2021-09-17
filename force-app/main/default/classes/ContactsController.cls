public with sharing class ContactsController {

    @AuraEnabled
    public static List<Contact> getContacts() {
        return [
            SELECT Id, FirstName, LastName, Email, AccountId, Account.Name, Phone, CreatedDate
            FROM Contact
            ORDER BY FirstName
            LIMIT 30
        ];
    }    

    @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        String name = searchKey + '%';
        return [
            SELECT Id, FirstName, LastName, Email, AccountId, Account.Name, Phone, CreatedDate
            FROM Contact
            WHERE FirstName LIKE :name
            ORDER BY FirstName
            LIMIT 30
        ];
    }
}
