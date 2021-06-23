# Azure Exercise

<p align="center">
  <img src="https://global-uploads.webflow.com/57570c1261112bf3445ae492/5a99800c56512700019e6c1b_microsoft-azure-640x401.png" width="330" title="hover text">  
</p>

### Registration:

**First of all I have created a free Azure Account in Azure Website:** <br>
https://azure.microsoft.com/en-us/free/

-----------------

### Create and deploy storage account
#### Create Template

I have created a file name `storageAccount.json` that creates a storage account resource. <br>
To deploy a storage account with a different name every time I made this template **reusable by adding a parameter** that you can use to pass in a **storage account name**. <br>

The *storageName* parameter is identified as a string. The maximum length is set to 24 characters to prevent any names that are too long. <br>

#### Deploy Template

Before running the deployment command, **I have created a resource group** named: *myResourceGroup* <br>
with the following command: <br>
 
`az group create --name myResourceGroup  --location "Central US"
`

**After having a ResourceGroup we can now deploy the template:** <br>

First I have created a variable that stores the path to the template file. <br>

`$templateFile=" D:\MatchPoint\storageAccount.json"
`

**And eventually i used the following command to deploy the Storage Account:** <br>

```
az deployment group create --name addnameparameter --resource-group myResourceGroup --template-file $templateFile --parameters storageName="paramstorage"
```

---------------

### Create an ARM template for a Windows server

For creating a Windows Server VM, I have used the ARM template from **quickstart Azure Quickstart** Templates, and provided the following parameters: <br>

<p align="center">
  <img src="https://i.ibb.co/JQWdRZp/windows-VM.jpg" width="500" title="hover text">  
</p>

After creating and deploying the VM, **a new ARM template file that defines the infrastructure and configuration of the VM was created**. <br> 

You can watch the template in `createWindowsMachine.json` file above. <br> 

**After the deployment is finished,  we can see the VM was created successfully in the Virtual Machines list:** <br>

<p align="center">
  <img src="https://i.ibb.co/YkRzbTK/VMwas-Created.jpg" width="900" title="hover text">  
</p>

-----------------

### Create and copy 100 blobs from Storage account A to B 

**The general idea of the algorithm of the script that I have created for that purpose:**

```c
    1.  create Storage Account - A (source)
    2.  create Storage Account - B (destination) 
    3.  LOOP : create 100 blobs in A
    4.  LOOP : copy all the containers and blobs from Storage Account A to Storage Account B.
```

***The full script can be found in the `Script.ps1 `file above.***

-----------------

### Visualizing data from Azure Monitor with Dashboards

**I have Created a custom dashboards in Azure Monitoring.**

```c
Azure Monitor helps you maximize the availability and performance of your applications and services.
It delivers a comprehensive solution for collecting, analyzing, and acting on telemetry from your cloud and on-premises environments. 
```

**Added a Virtual Machine Chart:** <br>
***Avg Data Disk Read Bytes/Sec*** for a Virtual Machine i have created:

<p align="center">
  <img src="https://i.ibb.co/9HxB4JT/metrics.jpg" width="900" title="hover text">  
</p>

***Avg Data Disk Read Operations/Sec*** for the same Virtual Machine:
<p align="center">
  <img src="https://i.ibb.co/4NcKQ4S/metrics22.png" width="900" title="hover text">  
</p>

**Added a Storage Account Chart:** <br>
***Avg Success Server Latency*** for a Storage Account Resource i have created:

<p align="center">
  <img src="https://i.ibb.co/wK2Q74c/storageaccount-Metrics.jpg" width="900" title="hover text">  
</p>


-----------------

<p align="center">
  <b>© 2021 Tal Mosenzon. All rights reserved.</b>
</p>

<p align="center">
     <img src="https://pluralsight2.imgix.net/paths/images/powershell-a98a1ad445.png" width="200" title="hover text">  
  <img src="https://www.skolicicentrum.cz/images/thumbs/0011176_skoleni-microsoft-azure-nasazeni-a-sprava-cloudu_300.png" width="300" title="hover text">  
</p>


