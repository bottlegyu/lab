#! /bin/bash
# bash 쉘을 사용하겠다고 선언

# 소스리스트 변경
sudo sed -i 's/kr.archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

# 소스리스트 업데이트
sudo apt-get -y update

#oh-my-zsh 설치전 zsh 선 설치
sudo apt-get -y install zsh

#oh-my-zsh 설치
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#docker 설치(우분투 패키지 사용)
sudo apt-get -y install docker.io
sudo apt-get -y install docker.compose
 
