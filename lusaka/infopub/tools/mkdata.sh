mkdir -p /data1/comments
cd /data1/comments
for (( i=0; i<256; i++)); do
strl=`printf "%02X" $i`
mkdir $strl
cd $strl
for (( j=0; j<256; j++)); do
strc=`printf "%02X" $j`
mkdir $strc
done
cd ..
done
cd ..


mkdir -p /data1/wishs
cd /data1/wishs
for (( i=0; i<256; i++)); do
strl=`printf "%02X" $i`
mkdir $strl
cd $strl
for (( j=0; j<256; j++)); do
strc=`printf "%02X" $j`
mkdir $strc
done
cd ..
done
cd ..


mkdir -p /data1/ups
cd /data1/ups
for (( i=0; i<256; i++)); do
strl=`printf "%02X" $i`
mkdir $strl
cd $strl
for (( j=0; j<256; j++)); do
strc=`printf "%02X" $j`
mkdir $strc
done
cd ..
done
cd ..

mkdir -p  /data1/downs
cd /data1/downs
for (( i=0; i<256; i++)); do
strl=`printf "%02X" $i`
mkdir $strl
cd $strl
for (( j=0; j<256; j++)); do
strc=`printf "%02X" $j`
mkdir $strc
done
cd ..
done
cd ..

mkdir -p /data1/imgs
cd /data1/imgs
for (( i=0; i<256; i++)); do
strl=`printf "%02X" $i`
mkdir $strl
cd $strl
for (( j=0; j<256; j++)); do
strc=`printf "%02X" $j`
mkdir $strc
done
cd ..
done
cd ..

mkdir -p /data1/tmp
chmod 777 comments -R
chmod 777 wishs -R
chmod 777 ups -R
chmod 777 downs -R
chmod 777 tmp -R
chmod 777 imgs -R

