public class wrapperClassController 
{
 //Our collection of the class/wrapper objects cContact 
 public List<cContact> contactList {get; set;}
 public List<Contact> selectedContacts{get;set;}
 public Boolean blockRendered{get;set;}
 public Integer value {get;set;} 
 public wrapperClassController(){
 	blockRendered = false;
 }
 public List<cContact> getContacts() 
 {
  if(contactList == null) {
   contactList = new List<cContact>();
   //contact
   for(Contact c : [select Id, Name, Email, Phone from Contact limit 10]) 
   {
   //As each contact is processed we create a new cContact object and add it to the contactList
   contactList.add(new cContact(c));
   }
  }
  return contactList;
 }  
public PageReference processSelected()
 {
  //We create a new list of Contacts that we be populated only with Contacts if they are selected 
   selectedContacts = new List<Contact>();
  //We will cycle through our list of cContacts and will check to see if the selected 
  //property is set to true, if it is we add the Contact to the selectedContacts list 
   for(cContact cCon : getContacts()) {
    if(cCon.selected == true) {
       selectedContacts.add(cCon.con);
        }
    }
   value = selectedContacts.size();
   blockRendered=true;
   System.debug('printing listcontc'+selectedContacts.size());
   // Now we have our list of selected contacts and can perform any type of logic we want,
   // sending emails, updating a field on the Contact, etc 
   return null;
 }
    
public List<Contact> getSelectedContacts()
{
 System.debug('printing listcontc inside get'+selectedContacts.size());
 if(selectedContacts.size()>0)
     return selectedContacts;
 else return null;
}
 //This is our wrapper/container class. A container class is a class,a data structure,or an
 //abstract data type whose instances are collections of other objects. In this example a 
 //wrapper class contains both the standard salesforce object Contact and a Boolean value 
public class cContact 
{
 public Contact con {get; set;}
 public Boolean selected {get; set;}
 //This is the contructor method. When we create a new cContact object we pass a Contact 
 //that is set to the con property. We also set the selected value to false 
 
 public cContact(Contact c) {
            con = c;
            selected = false;
        }
    }
}