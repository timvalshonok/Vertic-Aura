@isTest
public with sharing class ContactsControllerTest {

    @TestSetup
    static void setup(){
        
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'Jack', LastName = 'Jackson'));
        insert contacts;
    }
    
    @isTest public static void getContactsTest() {

        Test.startTest();
        List<Contact> actual = ContactsController.getContacts();
        Test.stopTest();

        List<Contact> expected = [
        SELECT Id, FirstName, LastName, Email, AccountId, Account.Name, Phone, CreatedDate
        FROM Contact
        ORDER BY FirstName
        LIMIT 30];
        System.assertEquals(expected, actual, 'Should be list of contacts');
    }

    @isTest public static void findByNameTest() {

        String firstName = 'Jack';

        Test.startTest();
        List<Contact> actual = ContactsController.findByName(firstName);
        Test.stopTest();

        List<Contact> expected = [
            SELECT Id, FirstName, LastName, Email, AccountId, Account.Name, Phone, CreatedDate
            FROM Contact
            WHERE FirstName LIKE :firstName
            ORDER BY FirstName
            LIMIT 30];
        System.assertEquals(expected, actual, 'Should be contact with FirstName - "Jack"');
    }
}
