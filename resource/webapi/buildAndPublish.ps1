$HostUrl = "localhost:5002"
$AppName = "webapiapp"
$ImageName = $HostUrl + "/" +$AppName + ":" + $env:BUILD_NUMBER
$Dockerfile = "Dockerfile"

Write-Output "image name is: " + $ImageName

Write-Output "begin build image"
docker build --pull -t $ImageName -f $Dockerfile .

Write-Output "begin push image"
docker push $ImageName

Write-Output "success build and publish image: " +$ImageName
