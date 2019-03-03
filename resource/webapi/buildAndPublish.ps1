$HostUrl = "localhost:5002"
$AppName = "webapiapp"
$ImageName = $HostUrl + "/" +$AppName + ":" + $env:BUILD_NUMBER
$Dockerfile = "Dockerfile"

docker build --pull -t $ImageName -f $Dockerfile .
docker push $ImageName
