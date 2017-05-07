#import-module sqlps
#c:\

$server = new-object Microsoft.SqlServer.Management.Smo.Server(".")
$tempdb = $server.Databases.Item("tempdb")

$primaryGroup = $tempdb.FileGroups.item("primary")
$firstFile = $primaryGroup.files.Item("tempdev")
$secondFile = $primaryGroup.files.Item("tempdb2")

#$secondFile.drop()

$DataFileObject = New-Object Microsoft.SqlServer.Management.Smo.DataFile

$DataFileObject.Parent = $primaryGroup
$DataFileObject.Name = "tempdb2"
$DataFileObject.FileName = join-path $server.DefaultFile "tempdb2.mdf"
$DataFileObject.Size = 8192
$DataFileObject.GrowthType = "None"

$DataFileObject.Create()

$server.DefaultFile


