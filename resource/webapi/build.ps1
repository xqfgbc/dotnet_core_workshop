$ImageName = "webapiapp"
$Dockerfile = "Dockerfile"

docker build --pull -t $ImageName -f $Dockerfile .
