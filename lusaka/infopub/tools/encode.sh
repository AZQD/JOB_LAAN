#/usr/local/openresty/luajit/bin/luajit -b

Folder_A="." 
for file_a in ${Folder_A}/*.lua; do  
    temp_file=$file_a 
    temp_src=${temp_file}".src"
    cp $temp_file $temp_src
    /usr/local/openresty/luajit/bin/luajit -b $temp_src $temp_file 
    echo $temp_file  
    rm $temp_src
done 
