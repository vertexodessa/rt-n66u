docker build . -t asus_rtn66
docker rm asus_rtn66
docker run  --name asus_rtn66 asus_rtn66
docker cp asus_rtn66:/root/tomato_git/tomato/release/src-rt/image/ ./

