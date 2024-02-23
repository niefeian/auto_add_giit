
#!/bin/bash

read -p "您的Github账号名称: " input
echo "账号名称: $input"


touch $input.sh
content_="
git config user.email 'niefeian@gmail.com'
git config user.name '$input'
" # 需要追加的内容
file_path_=$input.sh # 目标文件路径
echo  "$content_" >> $file_path_


cd ~/.ssh
echo "请输入 id_rsa_$input"
ssh-keygen -t rsa -C "niefeian@gmail.com"
echo "config修改"


content="Host $input
HostName github.com 
User $input
IdentityFile ~/.ssh/id_rsa_$input
" # 需要追加的内容
file_path="/Users/niefeian/.ssh/config" # 目标文件路径
 
echo  "$content" >> $file_path


echo "复制公钥 github网站 → Settings → SSH and GPG keys → New SSH key"
rsa_pub="id_rsa_$input.pub"
cat $rsa_pub
pbcopy < $rsa_pub  

