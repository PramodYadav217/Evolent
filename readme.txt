
This demo project is developed for maintaining contact information.

This project is devided into to two different applications. 

1. AssignmentAPI - This is WEB API project developed in ASP.NET Web API 2.0, to perform CRUD operation for contact data. This provide following interfaces to,
	- Add contact
	- List contacts
	- Edit contact 
	- Delete contact 
	

2. AssignmentWeb - This is web application, developed in ASP.NET MVC 5, which consumed the above WEB API which provide an User Interface to perform,
	- Add contact
	- List contacts
	- Edit contact 
	- Delete contact 
	
The database used for this application is SQL Server 2008 Express edition. 
You can find the database backup file as - AssignmentDB.bak. You just restore database from backup file.

 
Run these application,

1. First run the AssignmentAPI project. 
	- Please make sure to change the sql server data source in the below connection string used in the following applications,
		- AssignmentAPI 	(in Web.Config file)
		- AssignmentAPIData (in App.Config file)
	- Change Datasource & password as per your SQL server setting in following connection string & paste it above project files.
<connectionStrings>
		<add name="AssignmentDBEntities2" connectionString="metadata=res://*/AssignmentModel.csdl|res://*/AssignmentModel.ssdl|res://*/AssignmentModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=NABARUN_SAHA\NABAEXPRESS;initial catalog=AssignmentDB;user id=sa;password=sa1234;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" /><add name="AssignmentDBEntities1" connectionString="metadata=res://*/AssignmentModel.csdl|res://*/AssignmentModel.ssdl|res://*/AssignmentModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=(local);initial catalog=AssignmentDB;user id=sa;password=sa1234;multipleactiveresultsets=True;application name=EntityFramework&quot;" providerName="System.Data.EntityClient" /><add name="AssignmentDBEntities2" connectionString="metadata=res://*/AssignmentModel.csdl|res://*/AssignmentModel.ssdl|res://*/AssignmentModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=(local);initial catalog=AssignmentDB;user id=sa;password=clarion;multipleactiveresultsets=True;application name=EntityFramework&quot;" providerName="System.Data.EntityClient" />
</connectionStrings>		
	


2. Second run the AssignmentWeb application project. 
	- As this project internally communicate with above WEB API project, make sure the port number of the above WEB API application running is same 
	as the following app settings in web.config file of this project
	
	<add key="AssignmentAPIURL" value="http://localhost:2749/api" />

For error logging ELMAH is used. To see the logs regarding the WEP API, you can browse the URL "http://localhost:1824/elmah.axd".
If the web api project is running on the port 1824. Otherwise adjust the port number accordingly. 



