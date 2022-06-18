public with sharing class UsersSelector 
{
    public static User getById(Id userId)
    {
        return [SELECT Id, Email, Phone, FirstName, LastName
                FROM User 
                WHERE Id = :userId];
    }
}
