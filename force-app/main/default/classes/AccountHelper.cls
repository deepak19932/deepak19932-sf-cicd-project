public class AccountHelper {

    /**
     * Returns a list of Accounts matching the given name (partial match).
     */
    public static List<Account> getAccountsByName(String searchName) {
        String searchPattern = '%' + String.escapeSingleQuotes(searchName) + '%';
        return [SELECT Id, Name, Industry, Phone, Website FROM Account WHERE Name LIKE :searchPattern];
    }

    /***
     * Creates new Account with the given name and industry.
     */
    public static Account createAccount(String name, String industry) {
        Account acc = new Account(Name = name, Industry = industry);
        insert acc;
        return acc;
    }

    /**
     * Returns the count of Contacts associated with an Account.
     */
    public static Integer getContactCount(Id accountId) {
        return [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
    }

    /**
     * Updates the Industry field for a list of Accounts.
     */
    public static void updateIndustry(List<Id> accountIds, String newIndustry) {
        List<Account> accounts = [SELECT Id, Industry FROM Account WHERE Id IN :accountIds];
        for (Account acc : accounts) {
            acc.Industry = newIndustry;
        }
        update accounts;
    }
}
