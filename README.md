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
  <img src="data:image/png;base64,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" width="300" title="hover text">  
</p>


