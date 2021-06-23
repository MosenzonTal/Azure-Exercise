# Create Storage Account sourceA:
New-AzureRmStorageAccount -ResourceGroupName "myResourceGroup" -AccountName "sourceabbbb123" -Location "westeurope" -Type "Standard_LRS"

# Create Storage Account B:
 New-AzureRmStorageAccount -ResourceGroupName "myResourceGroup" -AccountName "sourcebbccc123" -Location "westeurope" -Type "Standard_LRS"

# Create 100 Blob by Name:

$storagekey = Get-AzureRmStorageAccountKey -ResourceGroupName "myResourceGroup" -Name "sourceabbbb123"
$Key0 = $storagekey | Select-Object -First 1 -ExpandProperty Value
$context = New-AzureStorageContext -StorageAccountName "sourceabbbb123" -StorageAccountKey $Key0 -Protocol Http
for($i = 0; $i -lt 100; $i++) {
$name="folder123456tal$i"
New-AzureStorageContainer -Name $name -Permission Blob -Context $context
}

# Copy Blobs from A to B:

$storagekey2 = Get-AzureRmStorageAccountKey -ResourceGroupName "myResourceGroup" -Name "sourcebbccc123"
$Key1 = $storagekey2 | Select-Object -First 1 -ExpandProperty Value
$SourceStorageAccount = "sourceabbbb123"
$SourceStorageKey = $Key0 
$DestStorageAccount = "sourcebbccc123"
$DestStorageKey = $Key1
$SourceStorageContext = New-AzureStorageContext -StorageAccountName $SourceStorageAccount -StorageAccountKey $SourceStorageKey
$DestStorageContext = New-AzureStorageContext -StorageAccountName $DestStorageAccount -StorageAccountKey $DestStorageKey

$Containers = Get-AzureStorageContainer -Context $SourceStorageContext

foreach($Container in $Containers)
{
    $ContainerName = $Container.Name
    if (!((Get-AzureStorageContainer -Context $DestStorageContext) | Where-Object { $_.Name -eq $ContainerName }))
    {   
        Write-Output "Creating new container $ContainerName"
        New-AzureStorageContainer -Name $ContainerName -Permission Off -Context $DestStorageContext -ErrorAction Stop
    }

    $Blobs = Get-AzureStorageBlob -Context $SourceStorageContext -Container $ContainerName
    $BlobCpyAry = @() #Create array of objects

    #Do the copy of everything
    foreach ($Blob in $Blobs)
    {
       $BlobName = $Blob.Name
       Write-Output "Copying $BlobName from $ContainerName"
       $BlobCopy = Start-CopyAzureStorageBlob -Context $SourceStorageContext -SrcContainer $ContainerName -SrcBlob $BlobName -DestContext $DestStorageContext -DestContainer $ContainerName -DestBlob $BlobName
       $BlobCpyAry += $BlobCopy
    }
}


